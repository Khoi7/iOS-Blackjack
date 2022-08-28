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
    
    var body: some View {
        NavigationView {
            ZStack{
                RadialGradient(colors: [Color("Bright Table"), Color("Dark Table")], center: .center, startRadius: 0, endRadius: 400)
                    .ignoresSafeArea()
                VStack {
                    Text("Blackjack".uppercased())
                        .foregroundColor(.yellow)
                        .font(.system(size: 50, weight: .heavy, design: .serif))
                        .shadow(color: .black, radius: 10, x: 5, y: 5)
                        .padding(.bottom, 30)
                    
                    NavigationLink(destination: GameView()
                                    .navigationBarBackButtonHidden(true)) {
                        Text("New Game")
                            .modifier(MenuChoiceText())
                    }
                    Text("How To Play")
                        .modifier(MenuChoiceText())
                    Text("Highscores")
                        .modifier(MenuChoiceText())
                }

            }
            .preferredColorScheme(colorScheme)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
