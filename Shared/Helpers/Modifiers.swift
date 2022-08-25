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
