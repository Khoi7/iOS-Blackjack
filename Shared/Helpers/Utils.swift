/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Vu Duy Khoi
  ID: s3694615
  Created  date: 17/08/2022
  Last modified: 06/09/2022
  Acknowledgement:
 
    <a href="https://www.flaticon.com/free-icons/poker" title="poker icons">Poker icons created by Smashicons - Flaticon</a>
    
    <a href="https://www.flaticon.com/free-icons/poker-cards" title="poker cards icons">Poker cards icons created by rizal2109 - Flaticon</a>
    
    <a href="https://www.flaticon.com/free-icons/blackjack" title="blackjack icons">Blackjack icons created by Good Ware - Flaticon</a>
    
    https://betterprogramming.pub/card-flip-animation-in-swiftui-45d8b8210a00
    
    https://betterprogramming.pub/stack-navigation-on-macos-41a40d8ec3a4
    
*/

import Foundation
import AVFoundation

var backgroundAudioPlayer: AVAudioPlayer?
var audioPlayer: AVAudioPlayer?

func playSoundEffect(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
        } catch {
            print("ERROR: Could not find and play the sound file!")
        }
    }
}

func playSoundBackground(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
      do {
          backgroundAudioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
          backgroundAudioPlayer?.numberOfLoops = -1
          backgroundAudioPlayer?.volume = 0.5
          backgroundAudioPlayer?.play()
      } catch {
          print("ERROR: Could not find and play the sound file!")
      }
    }
}

func stopSoundBackground() {
    backgroundAudioPlayer?.stop()
}
