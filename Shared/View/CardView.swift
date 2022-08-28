//
//  CardView.swift
//  Blackjack (iOS)
//
//  Created by Khoi, Vu Duy on 28/08/2022.
//

import SwiftUI

struct CardView: View {
    let cardImages = [["joker"],
                           ["ace-of-hearts", "ace-of-diamonds", "ace-of-clubs", "ace-of-spades"], ["two-of-hearts", "two-of-diamonds", "two-of-clubs", "ace-of-spades"], ["three-of-hearts", "three-of-diamonds", "three-of-clubs", "three-of-spades"], ["four-of-hearts", "four-of-diamonds", "four-of-clubs", "four-of-spades"], ["five-of-hearts", "five-of-diamonds", "five-of-clubs", "five-of-spades"], ["six-of-hearts", "six-of-diamonds", "six-of-clubs", "six-of-spades"], ["seven-of-hearts", "seven-of-diamonds", "seven-of-clubs", "seven-of-spades"], ["eight-of-hearts", "eight-of-diamonds", "eight-of-clubs", "eight-of-spades"], ["nine-of-hearts", "nine-of-diamonds", "nine-of-clubs", "nine-of-spades"], ["ten-of-hearts", "ten-of-diamonds", "ten-of-clubs", "ten-of-spades"], ["jack-of-hearts", "jack-of-diamonds", "jack-of-clubs", "jack-of-spades"], ["queen-of-hearts", "queen-of-diamonds", "queen-of-clubs", "queen-of-spades"], ["king-of-hearts", "king-of-diamonds", "king-of-clubs", "king-of-spades"]]
    let number, suit: Int
    
    init(number: Int, suit: Int) {
        self.number = number
        self.suit = suit
    }
    
    var body: some View {
        Image(cardImages[number][suit])
            .resizable()
            .scaledToFit()
            .frame(width: 120, alignment: .center)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(number: 0, suit: 0)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}