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
