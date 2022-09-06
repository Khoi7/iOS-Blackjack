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

struct RoundedButton: View {
    let label: String
    var body: some View {
        RoundedRectangle(cornerRadius: 10, style: .continuous)
            .strokeBorder(.white, lineWidth: 1, antialiased: true)
        #if os(iOS)
            .frame(width: 110, height: 50, alignment: .leading)
        #elseif os(macOS)
            .frame(width: 80, height: 30, alignment: .leading)
        #endif
            .overlay {
                Text(label)
                    .foregroundColor(.white)
                #if os(iOS)
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                #elseif os(macOS)
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                #endif
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
