//
//  SwiftUIView.swift
//  Blackjack (iOS)
//
//  Created by Khoi, Vu Duy on 25/08/2022.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        ZStack{
            RadialGradient(colors: [Color("Dark Green"), Color("Bright Green")], center: .center, startRadius: 0, endRadius: 400)
                .ignoresSafeArea()
            VStack {
                Text("Blackjack".uppercased())
                    .foregroundColor(.yellow)
                    .font(.system(size: 50, weight: .heavy, design: .serif))
                    .shadow(color: .black, radius: 10, x: 5, y: 5)
                    .padding(.bottom, 30)
                Text("New Game")
                    .modifier(MenuChoiceText())
                Text("How To Play")
                    .modifier(MenuChoiceText())
                Text("Highscores")
                    .modifier(MenuChoiceText())
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
