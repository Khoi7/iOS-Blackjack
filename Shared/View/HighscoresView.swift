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

import SwiftUI

struct HighscoresView: View {
    @AppStorage("highscores") var highscores = ""
    var highscoresDict: [String:Int] {
        loadHighscore()
    }
    
    var body: some View {
        ZStack {
            RadialGradient(colors: [Color("Bright Table"), Color("Dark Table")], center: .center, startRadius: 0, endRadius: 400)
                .ignoresSafeArea()
            ScrollView{
                VStack {
                    Text("highscores".uppercased())
                        .modifier(HighscoreText())
                        .padding(.bottom, 30)
                    ForEach(sortDictDecreasing(dict: highscoresDict), id: \.key) { key, value in
                        HStack {
                            Text("\(key)")
                                .modifier(HighscoreText())
                            Spacer()
                            Text("\(value)")
                                .modifier(HighscoreText())
                        }
                        .padding(.vertical)
                    }
                    
                }
                .padding(.horizontal, 25)
                .padding(.vertical, 70)
            }
        }
        .onAppear(perform: {
            playSoundBackground(sound: "Bossa-nova-beat-music-loop", type: "mp3")
        })
    }
    
    func loadHighscore() -> [String:Int] {
        if !highscores.isEmpty {
            do {
                let result = try JSONDecoder().decode([String:Int].self, from: Data(highscores.utf8))
                print(result)
                print(highscores)
                return result
            } catch let error {
                print("Failed to decode: \(error)")
            }
        }
        return [:]
    }
    
    func sortDictDecreasing(dict: [String:Int]) -> Array<(key: String, value: Int)> {
        let sortedArrayOfTuples = dict.sorted { first, second in
            return first.value > second.value
        }
        return sortedArrayOfTuples
    }
}

struct HighscoresView_Previews: PreviewProvider {
    static var previews: some View {
        HighscoresView()
    }
}
