//
//  HighscoresView.swift
//  Blackjack (iOS)
//
//  Created by Bò Vũ Trụ on 03/09/2022.
//

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
