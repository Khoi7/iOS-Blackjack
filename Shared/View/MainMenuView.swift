//
//  SwiftUIView.swift
//  Blackjack (iOS)
//
//  Created by Khoi, Vu Duy on 25/08/2022.
//

import SwiftUI

struct MainMenuView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var showGameView = false
    @State var showHowToPlay = false
    @State var showHighscores = false
    @State var difficulty = 1
    
    var body: some View {
        NavigationView {
            ZStack{
                RadialGradient(colors: [Color("Bright Table"), Color("Dark Table")], center: .center, startRadius: 0, endRadius: 400)
                    .ignoresSafeArea()
                VStack {
                    Text("Vietnamese\nBlackjack".uppercased())
                        .foregroundColor(.yellow)
                        .font(.system(size: 50, weight: .heavy, design: .serif))
                        .multilineTextAlignment(.center)
                        .shadow(color: .black, radius: 10, x: 5, y: 5)
                        .padding(.bottom, 30)
                    NavigationLink(destination: GameView(showGameView: self.$showGameView, difficulty: self.$difficulty)
                                    .navigationBarHidden(true), isActive: $showGameView) {
                        Text("New Game")
                            .modifier(MenuChoiceText())
                    }
                    NavigationLink(destination: HowToPlayView()
                                    .navigationBarTitleDisplayMode(.inline), isActive: self.$showHowToPlay) {
                        Text("How To Play")
                            .modifier(MenuChoiceText())
                    }
                    Button {
                        showHighscores = true
                    } label: {
                        Text("Highscores")
                            .modifier(MenuChoiceText())
                    }
                    
                    Picker("Difficulty", selection: $difficulty) {
                        Text("Easy").tag(1)
                        Text("Medium").tag(2)
                    }
                    .pickerStyle(.segmented)
                    .padding(.horizontal, 60)
                }
            }
        }
        .sheet(isPresented: $showHighscores, onDismiss: {
            showHighscores = false
        }) {
            HighscoresView()
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
