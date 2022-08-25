//
//  ContentView.swift
//  Shared
//
//  Created by Khoi, Vu Duy on 25/08/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            RadialGradient(colors: [Color("Dark Green"), Color("Bright Green")], center: .center, startRadius: 0, endRadius: 400)
                .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
