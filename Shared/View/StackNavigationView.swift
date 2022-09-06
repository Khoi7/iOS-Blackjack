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

struct StackNavigationView<RootContent>: View where RootContent: View {
    
    @Binding var currentSubview: AnyView
    @Binding var showSubview: Bool
    let rootView: () -> RootContent
    
    init(currentSubview: Binding<AnyView>, showSubview: Binding<Bool>,
         @ViewBuilder rootView: @escaping () -> RootContent) {
        self._currentSubview = currentSubview
        self._showSubview = showSubview
        self.rootView = rootView
    }
    
    var body: some View {
        VStack {
            if !showSubview {
                rootView()
            } else {
                StackNavigationSubview(isVisible: $showSubview) {
                    currentSubview
                }
                .transition(.move(edge: .trailing))
            }
        }
    }
    
    
    private struct StackNavigationSubview<Content>: View where Content: View {
        @Binding var isVisible: Bool
        let contentView: () -> Content
        
        var body: some View {
            VStack {
                contentView()
            }
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button {
                        withAnimation(.easeOut) {
                            isVisible = false
                        }
                    } label: {
                        Label("back", systemImage: "chevron.left")
                    }
                }
            }
        }
    }
}

//struct StackNavigationView_Previews: PreviewProvider {
//    static var previews: some View {
//        StackNavigationView()
//    }
//}
