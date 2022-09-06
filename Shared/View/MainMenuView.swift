//
//  SwiftUIView.swift
//  Blackjack (iOS)
//
//  Created by Khoi, Vu Duy on 25/08/2022.
//

import SwiftUI

struct MainMenuView: View {
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("username") var username = "Default Player"
    @State var showGameView = false
    @State var showHowToPlay = false
    @State var showHighscores = false
    @State var difficulty = 1
    
    #if os(macOS)
    @State var chosenSubview = AnyView(ContentView())
    @State var showSubView = false
    #endif
    
    var body: some View {
        #if os(iOS)
        NavigationView {
            ZStack{
                RadialGradient(colors: [Color("Bright Table"), Color("Dark Table")], center: .center, startRadius: 0, endRadius: 400)
                    .ignoresSafeArea()
                VStack {
                    Text("Vietnamese\nBlackjack".uppercased())
                        .foregroundColor(.yellow)
                        .font(.system(size: 50, weight: .heavy, design: .serif))
                        .multilineTextAlignment(.center)
                        .shadow(color: .black, radius: 10, x: 5, y: 5)
                        .padding(.bottom, 30)
                    
                    #if os(iOS)
                    NavigationLink(destination: GameView(showGameView: self.$showGameView, difficulty: self.$difficulty)
                                    .navigationBarHidden(true), isActive: $showGameView) {
                        Text("New Game")
                            .modifier(MenuChoiceText())
                    }
                    NavigationLink(destination: HowToPlayView()
                                    .navigationBarTitleDisplayMode(.inline), isActive: self.$showHowToPlay) {
                        Text("How To Play")
                            .modifier(MenuChoiceText())
                    }
                    #endif
                    
                    Button {
                        showHighscores = true
                    } label: {
                        Text("Highscores")
                            .modifier(MenuChoiceText())
                    }
                    TextField("Username", text: $username)
                        .padding(.horizontal, 70)
                        .padding(.vertical, 30)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(.roundedBorder)
                    
                    Picker("Difficulty", selection: $difficulty) {
                        Text("Easy").tag(1)
                        Text("Medium").tag(2)
                    }
                    .pickerStyle(.segmented)
                    .padding(.horizontal, 60)
                }
            }
            .onAppear(perform: {
                playSoundBackground(sound: "Breakbeat-downtempo-electronic-loop", type: "mp3")
            })
        }
        .navigationViewStyle(.stack)
        .sheet(isPresented: $showHighscores, onDismiss: {
            showHighscores = false
            playSoundBackground(sound: "Breakbeat-downtempo-electronic-loop", type: "mp3")
        }) {
            HighscoresView()
        }
        
        
        #elseif os(macOS)
        StackNavigationView(currentSubview: $chosenSubview, showSubview: $showSubView) {
            ZStack{
                RadialGradient(colors: [Color("Bright Table"), Color("Dark Table")], center: .center, startRadius: 0, endRadius: 400)
                    .ignoresSafeArea()
                VStack {
                    Text("Vietnamese\nBlackjack".uppercased())
                        .foregroundColor(.yellow)
                        .font(.system(size: 50, weight: .heavy, design: .serif))
                        .multilineTextAlignment(.center)
                        .shadow(color: .black, radius: 10, x: 5, y: 5)
                        .padding(.bottom, 30)
                    
                    Button {
                        showSubView = true
                        chosenSubview = AnyView(GameView(showGameView: self.$showSubView, difficulty: self.$difficulty))
                    } label: {
                        Text("New Game")
                            .modifier(MenuChoiceText())
                    }
                    .buttonStyle(.plain)
                    
                    Button {
                        showSubView = true
                        chosenSubview = AnyView(HowToPlayView())
                    } label: {
                        Text("How To Play")
                            .modifier(MenuChoiceText())
                    }
                    .buttonStyle(.plain)

                    
                    Button {
                        showSubView = true
                        chosenSubview = AnyView(HighscoresView())
                        playSoundBackground(sound: "Breakbeat-downtempo-electronic-loop", type: "mp3")
                    } label: {
                        Text("Highscores")
                            .modifier(MenuChoiceText())
                    }
                    .buttonStyle(.plain)
                    
                    TextField("Username", text: $username)
                        .padding(.horizontal, 70)
                        .padding(.vertical, 30)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(.roundedBorder)
                    
                    Picker("Difficulty", selection: $difficulty) {
                        Text("Easy").tag(1)
                        Text("Medium").tag(2)
                    }
                    .pickerStyle(.segmented)
                    .padding(.horizontal, 60)
                }
            }
            .onAppear(perform: {
                playSoundBackground(sound: "Breakbeat-downtempo-electronic-loop", type: "mp3")
            })
        }
        #endif
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
