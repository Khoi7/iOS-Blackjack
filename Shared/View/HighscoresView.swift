//
//  HighscoresView.swift
//  Blackjack (iOS)
//
//  Created by Bò Vũ Trụ on 03/09/2022.
//

import SwiftUI

struct HighscoresView: View {
    @AppStorage("defaultHighscore") var defaultHighscore: Int = 500
    
    var body: some View {
        ZStack {
            RadialGradient(colors: [Color("Bright Table"), Color("Dark Table")], center: .center, startRadius: 0, endRadius: 400)
                .ignoresSafeArea()
            VStack {
                Text("highscores".uppercased())
                    .modifier(HighscoreText())
                    .padding(.bottom, 30)
                HStack {
                    Text("Default player")
                        .modifier(HighscoreText())
                    Spacer()
                    Text("\(defaultHighscore)")
                        .modifier(HighscoreText())
                        
                }
            }
            .padding(.horizontal, 25)
        }
    }
}

struct HighscoresView_Previews: PreviewProvider {
    static var previews: some View {
        HighscoresView()
    }
}
