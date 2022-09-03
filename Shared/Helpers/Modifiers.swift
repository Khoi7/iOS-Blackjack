//
//  SwiftUIView.swift
//  Blackjack (iOS)
//
//  Created by Khoi, Vu Duy on 25/08/2022.
//

import SwiftUI

struct MenuChoiceText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 30, weight: .semibold, design: .serif))
            .padding(.bottom, 20)
            .shadow(color: .black, radius: 10, x: 5, y: 5)
    }
}

struct TutorialTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.yellow)
            .font(.system(size: 30, weight: .bold, design: .monospaced))
    }
}

struct TutorialContent: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18, design: .monospaced))
            .padding(.bottom)
    }
}

struct BackButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .scaledToFit()
            .frame(width: 30)
            .padding(.leading, 20)
            .padding(.top, 20)
    }
}

struct ResultText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 60, weight: .semibold, design: .rounded))
            .foregroundColor(.yellow)
            .shadow(color: .orange, radius: 1, x: 2, y: 5)
    }
}

struct NewGameButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 30, weight: .semibold))
            .foregroundColor(.yellow)
            .padding(.vertical, 10)
            .padding(.horizontal, 30)
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
            .font(.system(size: 20, weight: .semibold, design: .rounded))
            .foregroundColor(.black)
    }
}

struct CardViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(width: 120, alignment: .center)
    }
}
