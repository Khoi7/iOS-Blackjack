//
//  ChipView.swift
//  Blackjack (iOS)
//
//  Created by Khoi, Vu Duy on 29/08/2022.
//

import SwiftUI

struct ChipView: View {
    let chipType: String
    var body: some View {
        Image(chipType)
            .resizable()
            .scaledToFit()
        #if os(iOS)
            .frame(height: 60)
            .padding(.trailing, 5)
            .padding(.leading, 5)
        #elseif os(macOS)
            .frame(height: 30)
        #endif
            
    }
}

struct ChipView_Previews: PreviewProvider {
    static var previews: some View {
        ChipView(chipType: "chip50")
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
