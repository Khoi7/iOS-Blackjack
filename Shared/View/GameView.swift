//
//  GameView.swift
//  Blackjack (iOS)
//
//  Created by Khoi, Vu Duy on 26/08/2022.
//

import SwiftUI

struct GameView: View {
    
    var body: some View {
        ZStack {
            RadialGradient(colors: [Color("Bright Table"), Color("Dark Table")], center: .center, startRadius: 0, endRadius: 400)
                .ignoresSafeArea()
            VStack {
                // MARK: CPU hand
                ZStack {
                    CardView(number: 0, suit: 0)
                    CardView(number: 0, suit: 0)
                        .offset(x: 50, y: 0)
                }
                
                Spacer()
                
                // MARK: Player hand
                ZStack {
                    CardView(number: 1, suit: 3)
                    CardView(number: 13, suit: 0)
                        .offset(x: 50, y: 0)
                }
            }
        }
        .navigationBarHidden(true)
        .navigationTitle("")
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
