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
    @State var playerPoints = 0
    @State var dealerPoints = 0
    
    @State var coins = 500
    @State var bet = 0
    
    @State var deck = [[Int]]()
    
    @State var revealed = false
   
    var body: some View {
        ZStack {
            RadialGradient(colors: [Color("Bright Table"), Color("Dark Table")], center: .center, startRadius: 0, endRadius: 400)
                .ignoresSafeArea()
            VStack {
                
                // MARK: CPU hand
                if (dealCard) {
                    HStack {
                        if revealed {
                            ForEach(Array(zip(dealerCards.indices, dealerCards)), id:\.0) { index, card in
                                if (index == 0) {
                                    CardView(number: card[0], suit: card[1])
                                } else {
                                    CardView(number: card[0], suit: card[1])
                                        .padding(.leading, -90)
                                }
                            }
                        } else {
                            CardView(number: 0, suit: 0)
                            CardView(number: 0, suit: 0)
                                .padding(.leading, -90)
                        }
                    }
                }
                
                Spacer()
                
                // MARK: Player hand
                if (dealCard) {
                    HStack() {
                        ForEach(Array(zip(playerCards.indices, playerCards)), id:\.0) { index, card in
                            if (index == 0) {
                                CardView(number: card[0], suit: card[1])
                            } else {
                                CardView(number: card[0], suit: card[1])
                                    .padding(.leading, -90)
                            }
                        }
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
                        Button {
                            if getHandValue(hand: playerCards) >= 16 {
                                stand(hand: playerCards)
                                revealed = true
                                dealerPlays()
                            }
                        } label: {
                            RoundedButton(label: "Stand")
                        }
                    }
                    
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 3)
                            .foregroundColor(.yellow)
                            .frame(width:140, height: 150)
                            .background(Circle()
                            .foregroundColor(Color("Transparent Black")))
                        VStack {
                            Text("$\(bet)")
                                .foregroundColor(.white)
                            ZStack {
                                ForEach(Array(zip(betChips.indices, betChips)), id:\.0) { index, chip in
                                    createChipOffset(chipType: chip, index: index)
                                }
                            }
                        }
                        .frame(height: 110, alignment: .top)
                    }
                    
                    if (dealCard) {
                        Button {
                            if !revealed {
                                hit(hand: &playerCards)
                            }
                        } label: {
                            RoundedButton(label: "Hit")
                        }
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

    func createChipOffset(chipType: String, index: Int) -> some View {
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
                if i%2 == 1 {
                    playerCards.append(deck[index])
                } else {
                    dealerCards.append(deck[index])
                }
                deck.remove(at: index)
            }
        }
    }
    
    func hit(hand: inout [[Int]]) {
        var sum: Int = 0
        for card in hand {
            sum += getCardValue(number: card[0])
        }
        if sum <= 21 && hand.count < 5 {
            if let newCardIndex = deck.indices.randomElement() {
                hand.append(deck[newCardIndex])
                deck.remove(at: newCardIndex)
            }
        }
    }
    
    func stand(hand: [[Int]]) {
        if hand == playerCards {
            playerPoints = getHandValue(hand: hand)
        } else if hand == dealerCards {
            dealerPoints = getHandValue(hand: hand)
        }
    }
    
    func getCardValue(number: Int) -> Int {
        let value: Int
        if number >= 10 {
            value = 10
        } else {
            value = number
        }
        return value
    }
    
    func sumCardNormal(hand: [[Int]]) -> Int {
        var sum: Int = 0
        for card in hand {
            sum += getCardValue(number: card[0])
        }
        return sum
    }
    
    func sumCardWithAce(hand: [[Int]]) -> Int {
        var sum: Int = 0
        for card in hand {
            if card[0] == 1 {
                for value in [1,10,11] {
                    if (sum + value > sum) && (sum + value <= 21) {
                        sum += value
                    }
                }
            } else {
                sum += getCardValue(number: card[0])
            }
        }
        return sum
    }
    
    func sumCard(hand: [[Int]]) -> Int {
        var ace = false
        var sum: Int = 0
        for card in hand  {
            ace = card[0] == 1 ? true : false
        }
        if ace {
            sum = sumCardWithAce(hand: hand)
        } else {
            sum = sumCardNormal(hand: hand)
        }
        return sum
    }
    
    func getHandValue(hand: [[Int]]) -> Int {
        var value = 0
        var numbers = [Int]()
        for card in hand {
            numbers.append(getCardValue(number: card[0]))
        }
        if numbers.count == 2 {
            if numbers.contains(1) && numbers.contains(10) {
                value = 99
            } else if numbers[0] == 1 && numbers[1] == 1 {
                value = 100
            } else {
                value = sumCard(hand: hand)
            }
        } else {
            let sum = sumCard(hand: hand)
            if numbers.count == 5 {
                value = sum <= 21 ? 98 : sum
            } else {
                value = sum
            }
        }
        return value
    }
    
    func dealerPlays() {
        var points = getHandValue(hand: dealerCards)
        while points < 15 {
            hit(hand: &dealerCards)
            points = getHandValue(hand: dealerCards)
        }
        stand(hand: dealerCards)
        bet = points
    }
}

// MARK: Preview
struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(showGameView: .constant(true))
        MainMenuView()
    }
}
