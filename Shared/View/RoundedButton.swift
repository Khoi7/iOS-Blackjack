//
//  SwiftUIView.swift
//  Blackjack (iOS)
//
//  Created by Bò Vũ Trụ on 30/08/2022.
//

import SwiftUI

struct RoundedButton: View {
    let label: String
    var body: some View {
        RoundedRectangle(cornerRadius: 10, style: .continuous)
            .strokeBorder(.white, lineWidth: 1, antialiased: true)
            .frame(width: 110, height: 50, alignment: .leading)
            .overlay {
                Text(label)
                    .foregroundColor(.white)
                    .font(.system(size: 25, weight: .bold, design: .rounded))
            }
            .background {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .foregroundColor(Color("Transparent White"))
            }
    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButton(label: "Stand")
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
