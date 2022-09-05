//
//  Utils.swift
//  Blackjack (iOS)
//
//  Created by Bò Vũ Trụ on 05/09/2022.
//

import Foundation
import AVFoundation

var backgroundAudioPlayer: AVAudioPlayer?
var audioPlayer: AVAudioPlayer?

func playSoundEffect(sound: String, type: String) {
  if let path = Bundle.main.path(forResource: sound, ofType: type) {
    do {
        if audioPlayer != nil {
            while audioPlayer!.isPlaying {
            }
        }
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
          backgroundAudioPlayer?.play()
      } catch {
          print("ERROR: Could not find and play the sound file!")
      }
    }
}
