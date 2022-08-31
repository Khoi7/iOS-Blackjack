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
    @State var dealCard = false
    @State var betChips = [String]()
    
    @State var playerCards = [[Int]]()
    @State var dealerCards = [[Int]]()
    
    @State var coins = 500
    @State var bet = 0
    
    @State var deck = [[Int]]()
   
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
                        CardView(number: playerCards[0][0], suit: playerCards[0][1])
                            .offset(x: -25, y: 0)
                        CardView(number: playerCards[1][0], suit: playerCards[1][1])
                            .offset(x: 25, y: 0)
                    }
                } else {
                    // MARK: Bet button
                    Button {
                        if bet != 0 {
                            deck = initDeck()
                            deal()
                            dealCard = true
                        }
                    } label: {
                        RoundedButton(label: "Bet")
                    }
                }
                // MARK: Player actions
                HStack(spacing:17){
                    if (dealCard) {
                        RoundedButton(label: "Stand")
                    }
                    
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 3)
                            .foregroundColor(.yellow)
                            .frame(width:140, height: 150)
                            .background(Circle()
                            .foregroundColor(Color("Transparent Black")))
                        VStack {
                            Text("Bet: $ \(bet)")
                                .foregroundColor(.white)
                            ZStack {
                                ForEach(Array(zip(betChips.indices, betChips)), id:\.0) { index, chip in
                                    createChipBet(chipType: chip, index: index)
                                }
                            }
                        }
                        .frame(height: 110, alignment: .top)
                    }
                    
                    if (dealCard) {
                        RoundedButton(label: "Hit")
                    }
                }
                
                // MARK: Bet chip choices
                HStack (alignment: .center) {
                    ForEach(["chip5", "chip10", "chip50", "chip100", "chipMinus"], id: \.self) { chip in
                        Button {
                            if chip != "chipMinus" {
                                addBet(chip: chip)
                            } else {
                                minusBet()
                            }
                        } label: {
                            ChipView(chipType: chip)
                        }
                    }
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
        // MARK: Back button
        .overlay(alignment: .topLeading) {
            Button(){
                showGameView = false
            } label: {
                Image(systemName: "arrow.backward")
                    .resizable()
                    .modifier(BackButton())
            }
        }
    }

    //MARK: Functions
    func getChipValue(chipType: String) -> Int {
        let result = Int(chipType.components(separatedBy: CharacterSet.decimalDigits.inverted).joined())!
        return result
    }

    func createChipBet(chipType: String, index: Int) -> some View {
        let x, y: CGFloat
        switch index % 6 {
        case 1:
            x = 0
            y = 0
        case 2:
            x = 20
            y = 0
        case 3:
            x = 20
            y = 20
        case 4:
            x = 0
            y = 20
        case 5:
            x = -20
            y = 20
        default:
            x = -20
            y = 0
        }
        let chip = ChipView(chipType: chipType)
            .offset(x: x, y: y)
        return chip
    }

    func addBet(chip: String) {
        if dealCard == false {
            let chipValue = getChipValue(chipType: chip)
            if (self.coins - chipValue >= 0) {
                self.betChips.append(chip)
                self.bet += chipValue
                self.coins -= chipValue
            }
        }
    }
    
    func minusBet() {
        if dealCard == false {
            if (betChips.count > 0) {
                let removed = betChips.removeLast()
                let removedValue = getChipValue(chipType: removed)
                self.bet -= removedValue
                self.coins += removedValue
            }
        }
    }
    
    func initDeck() -> [[Int]] {
        var temp = [[Int]]()
        for cardSuit in 0...3 {
            for cardNum in 1...13 {
                temp.append([cardNum, cardSuit])
            }
        }
        return temp
    }
    
    func deal() {
        for i in 1...4 {
            if let index = deck.indices.randomElement() {
                deck.remove(at: index)
                if i%2 == 1 {
                    playerCards.append(deck[index])
                } else {
                    dealerCards.append(deck[index])
                }
            }
        }
    }
}

// MARK: Preview
struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(showGameView: .constant(true))
        MainMenuView()
    }
}
