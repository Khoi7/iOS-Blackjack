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

struct HowToPlayView: View {
    var body: some View {
        ZStack {
            RadialGradient(colors: [Color("Bright Table"), Color("Dark Table")], center: .center, startRadius: 0, endRadius: 400)
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading) {
                        
                    Text("Object of the game".uppercased())
                        .modifier(TutorialTitle())
                    Text("Player attempts to beat the dealer (CPU) by getting a count as close to 21 as possible, without going over 21 or below 16.")
                        .modifier(TutorialContent())
                    
                    Text("Card values".uppercased())
                        .modifier(TutorialTitle())
                    Text("It is up to each individual player if an ace is worth 1 or 10 or 11. Face cards are 10 and any other card is its pip value.\n\nIf a player's first two cards are an ace and a \"ten-card\" (a picture card or 10), giving a count of 21 in two cards, this is \"blackjack\".\n\nIf a player's first two cards are both aces, this is a \"double aces\"\n\nIf a player get five cards of 21 or less in total, this is a \"magical five\"\n\nIf a player get mroe than 21 in total, this is a \"bust\"")
                        .modifier(TutorialContent())
                    
                    Text("Main game play".uppercased())
                        .modifier(TutorialTitle())
                    Text("After the cards are dealt, if either the player or the dealer has \"blackjack\" or \"double aces\", the winner is determined immediately. \n\nIf not, the player plays first and must choose to \"Stand\" (not ask for 1 more card) or \"Hit\" (ask for another card).\n\nAfter player decided to \"stand\" or reached limit of 5 cards, it is the dealer's turn (CPU) to do same process.\n\n The dealer only need to reach the minimum of 15 to \"stand\".\n\n Then the player and dealer compare their hands to determine the winner")
                        .modifier(TutorialContent())
                    
                    Text("Determine winner".uppercased())
                        .modifier(TutorialTitle())
                    Text("Winner is determined based on this ranking (from strongest to weakest hand):\n1/Double aces\n2/Blackjack\n3/Magical five (if both have magical fives, the one with less total points wins)\n4/Compare total pip value (the one with greater total points wins)\n5/Bust")
                        .modifier(TutorialContent())
                    }
                .padding(.horizontal, 15)
            }
        }
        .onAppear(perform: {
            playSoundBackground(sound: "Waltz-music-loop", type: "mp3")
        })
    }
}

struct HowToPlayView_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlayView()
    }
}
