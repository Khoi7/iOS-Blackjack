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

struct MenuChoiceText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
        #if os(iOS)
            .font(.system(size: 30, weight: .semibold, design: .serif))
        #elseif os(macOS)
            .font(.system(size: 15, weight: .semibold, design: .serif))
        #endif
            .padding(.bottom, 20)
            .shadow(color: .black, radius: 10, x: 5, y: 5)
    }
}

struct TutorialTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.yellow)
        #if os(iOS)
            .font(.system(size: 30, weight: .bold, design: .monospaced))
        #elseif os(macOS)
            .font(.system(size: 15, weight: .bold, design: .monospaced))
        #endif
    }
}

struct TutorialContent: ViewModifier {
    func body(content: Content) -> some View {
        content
            #if os(iOS)
            .font(.system(size: 18, design: .monospaced))
            #elseif os(macOS)
            .font(.system(size: 10, design: .monospaced))
            #endif
            .padding(.bottom)
    }
}

struct BackButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .scaledToFit()
            #if os(iOS)
            .frame(width: 30)
            #elseif os(macOS)
            .frame(width:20)
            #endif
            .padding(.leading, 20)
            .padding(.top, 20)
    }
}

struct ResultText: ViewModifier {
    func body(content: Content) -> some View {
        content
            #if os(iOS)
            .font(.system(size: 60, weight: .semibold, design: .rounded))
            #elseif os(macOS)
            .font(.system(size: 20, weight: .semibold))
            #endif
            .foregroundColor(.yellow)
            .shadow(color: .orange, radius: 1, x: 2, y: 5)
    }
}

struct NewGameButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            #if os(iOS)
            .font(.system(size: 30, weight: .semibold))
            .padding(.vertical, 10)
            .padding(.horizontal, 30)
            #elseif os(macOS)
            .font(.system(size: 15, weight: .semibold))
            .padding(.vertical, 4)
            .padding(.horizontal, 15)
            #endif
            .foregroundColor(.yellow)
            .background {
                Capsule()
                    .foregroundColor(.orange)
                    .opacity(0.8)
            }
    }
}

struct HighscoreText: ViewModifier {
    func body(content: Content) -> some View {
        content
            #if os(iOS)
            .font(.system(size: 20, weight: .semibold, design: .rounded))
            #elseif os(macOS)
            .font(.system(size: 10, weight: .semibold, design: .rounded))
            #endif
            .foregroundColor(.black)
    }
}

struct CardViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            #if os(iOS)
            .frame(width: 120, alignment: .center)
            #elseif os(macOS)
            .frame(width: 100, alignment: .center)
            #endif
    }
}
