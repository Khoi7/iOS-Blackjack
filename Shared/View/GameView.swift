//
//  GameView.swift
//  Blackjack (iOS)
//
//  Created by Khoi, Vu Duy on 26/08/2022.
//
// <a href="https://www.flaticon.com/free-icons/poker" title="poker icons">Poker icons created by Smashicons - Flaticon</a>
// <a href="https://www.flaticon.com/free-icons/poker-cards" title="poker cards icons">Poker cards icons created by rizal2109 - Flaticon</a>

import SwiftUI

struct GameView: View {
    @Binding var showGameView: Bool
    @State var dealCard = true
    
    @State var coins = 0
    @State var bet = 0
    
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
                HStack(spacing:17){
                    RoundedButton(label: "Stand")
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 3)
                            .foregroundColor(.yellow)
                            .frame(width:150, height: 150)
                            .background(Circle()
                                .foregroundColor(Color("Transparent Black")))
                        VStack {
                            Text("Bet: $ \(bet)")
                                .foregroundColor(.white)
                            ChipView(chipType: "chip50")
                        }
                    }
                    RoundedButton(label: "Hit")
                }
                HStack (alignment: .center) {
                    ChipView(chipType: "chip5")
                    ChipView(chipType: "chip10")
                    ChipView(chipType: "chip50")
                    ChipView(chipType: "chip100")
                    ChipView(chipType: "chipMinus")
                }
                .padding(.top, 30)
                
                Capsule(style: .continuous)
                    .frame(width:200, height: 40, alignment: .center)
                    .foregroundColor(Color("Transparent Black"))
                    .padding()
                    .overlay {
                        Text("$ \(coins)")
                            .foregroundColor(.white)
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
