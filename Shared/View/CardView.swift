/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Vu Duy Khoi
  ID: s3694615
  Created  date: 17/08/2022
  Last modified: 06/09/2022
  Acknowledgement:
 
    <a href="https://www.flaticon.com/free-icons/poker" title="poker icons">Poker icons created by Smashicons - Flaticon</a>
    
    <a href="https://www.flaticon.com/free-icons/poker-cards" title="poker cards icons">Poker cards icons created by rizal2109 - Flaticon</a>
    
    <a href="https://www.flaticon.com/free-icons/blackjack" title="blackjack icons">Blackjack icons created by Good Ware - Flaticon</a>
    
    https://betterprogramming.pub/card-flip-animation-in-swiftui-45d8b8210a00
    
    https://betterprogramming.pub/stack-navigation-on-macos-41a40d8ec3a4
    
*/

import SwiftUI

struct CardView: View {
    let cardImages = [["joker"],
                           ["ace-of-hearts", "ace-of-diamonds", "ace-of-clubs", "ace-of-spades"], ["two-of-hearts", "two-of-diamonds", "two-of-clubs", "two-of-spades"], ["three-of-hearts", "three-of-diamonds", "three-of-clubs", "three-of-spades"], ["four-of-hearts", "four-of-diamonds", "four-of-clubs", "four-of-spades"], ["five-of-hearts", "five-of-diamonds", "five-of-clubs", "five-of-spades"], ["six-of-hearts", "six-of-diamonds", "six-of-clubs", "six-of-spades"], ["seven-of-hearts", "seven-of-diamonds", "seven-of-clubs", "seven-of-spades"], ["eight-of-hearts", "eight-of-diamonds", "eight-of-clubs", "eight-of-spades"], ["nine-of-hearts", "nine-of-diamonds", "nine-of-clubs", "nine-of-spades"], ["ten-of-hearts", "ten-of-diamonds", "ten-of-clubs", "ten-of-spades"], ["jack-of-hearts", "jack-of-diamonds", "jack-of-clubs", "jack-of-spades"], ["queen-of-hearts", "queen-of-diamonds", "queen-of-clubs", "queen-of-spades"], ["king-of-hearts", "king-of-diamonds", "king-of-clubs", "king-of-spades"]]
    let number, suit: Int
    @Binding var backDegree: Double
    @Binding var frontDegree: Double
    
    init(number: Int, suit: Int, backDegree: Binding<Double> = .constant(-90), frontDegree: Binding<Double> = .constant(0)) {
        self._backDegree = backDegree
        self._frontDegree = frontDegree
        self.number = number
        self.suit = suit
    }
    
    var body: some View {
        ZStack {
            // Back
            Image(cardImages[0][0])
                .resizable()
                .modifier(CardViewModifier())
                .rotation3DEffect(Angle(degrees: backDegree), axis: (x: 0, y: 1, z: 0))
            
            // Front
            Image(cardImages[number][suit])
                .resizable()
                .modifier(CardViewModifier())
                .rotation3DEffect(Angle(degrees: frontDegree), axis: (x: 0, y: 1, z: 0))
        }
    }
}

struct CardView_Previews: PreviewProvider {
    @State var cardUp = false
    static var previews: some View {
        Group {
            HStack {
                CardView(number: 1, suit: 3)
                    .padding(.leading,0)
                CardView(number: 4, suit: 1)
                    .padding(.leading, -90)
                CardView(number: 0, suit: 0)
                    .padding(.leading, -90)
                CardView(number: 0, suit: 0)
                    .padding(.leading, -90)

            }
        }
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
