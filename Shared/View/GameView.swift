//
//  GameView.swift
//  Blackjack (iOS)
//
//  Created by Khoi, Vu Duy on 26/08/2022.
//

import SwiftUI

struct GameView: View {
    @Binding var showGameView: Bool
    @State var dealCard = true
    
    @State var coins = 0
    
    var body: some View {
        ZStack {
            RadialGradient(colors: [Color("Bright Table"), Color("Dark Table")], center: .center, startRadius: 0, endRadius: 400)
                .ignoresSafeArea()
            VStack {
                
                // MARK: CPU hand
                if (dealCard) {
                    ZStack {
                        CardView(number: 0, suit: 0)
                            .offset(x: -25, y: 0)
                        CardView(number: 0, suit: 0)
                            .offset(x: 25, y: 0)
                    }
                }
                
                Spacer()
                
                // MARK: Player hand
                if (dealCard) {
                    ZStack {
                        CardView(number: 1, suit: 3)
                            .offset(x: -25, y: 0)
                        CardView(number: 13, suit: 0)
                            .offset(x: 25, y: 0)
                    }
                }
                HStack (alignment: .center) {
                    ChipView(chipType: "chip5")
                    ChipView(chipType: "chip10")
                    ChipView(chipType: "chip50")
                    ChipView(chipType: "chip100")
                }
                .padding(.top, 30)
                Capsule(style: .continuous)
                    .frame(width:200, height: 40, alignment: .center)
                    .foregroundColor(Color("Transparent Black"))
                    .overlay {
                        Text("\(coins)")
                    }
            }
        }
        .overlay(alignment: .topLeading) {
            Button(){
                showGameView = false
            } label: {
                Image(systemName: "arrow.backward")
                    .resizable()
                    .foregroundColor(.white)
                    .scaledToFit()
                    .frame(width: 30)
                    .padding(.leading, 20)
                    .padding(.top, 20)
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(showGameView: .constant(true))
    }
}
