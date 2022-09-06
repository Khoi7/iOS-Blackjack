//
//  StackNavigationView.swift
//  Blackjack (macOS)
//
//  Created by Khoi, Vu Duy on 06/09/2022.
//

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
