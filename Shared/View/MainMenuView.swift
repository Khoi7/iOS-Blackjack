//
//  SwiftUIView.swift
//  Blackjack (iOS)
//
//  Created by Khoi, Vu Duy on 25/08/2022.
//

import SwiftUI

struct MainMenuView: View {
    @State var colorScheme: ColorScheme = .light
    @State var darkMode = false
    @State var showGameView = false
    @State var showHowToPlay = false
    @State var showHighscores = false
    
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
                    NavigationLink(destination: GameView(showGameView: self.$showGameView)
                                    .navigationBarHidden(true), isActive: $showGameView) {
                        Text("New Game")
                            .modifier(MenuChoiceText())
                    }
                    NavigationLink(destination: HowToPlayView()
                                    .navigationBarTitleDisplayMode(.inline), isActive: self.$showHowToPlay) {
                        Text("How To Play")
                            .modifier(MenuChoiceText())
                    }
                    Text("Highscores")
                        .modifier(MenuChoiceText())
                    Toggle("dark mode".capitalized, isOn: self.$darkMode)
                        .padding(.top, 50)
                        .toggleStyle(.button)
                        .tint(Color("Transparent Black"))
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold, design: .serif))
                }
            }
            .preferredColorScheme(self.darkMode ? .dark : .light)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
