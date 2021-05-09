//
//  ContentView.swift
//  QuickTacToe
//
//  Created by Roberto Romero on 03-05-21.
//

import SwiftUI

struct ContentView: View {
    @State var showAIOptions = false
    @State var navigateToBoard = false
    @State var currentAi:AIPlayer? = nil
    var body: some View {
        NavigationView {
            ZStack {
                    Color.appBackgroundOrange.ignoresSafeArea()
                    VStack {
                        Logo()
                            .padding()
                            
                            .padding(.bottom,50)
                        Spacer()
                        ZStack {
                            VStack{
                                
                                MenuButton(buttonAction: {
                                    self.currentAi = EasyAI()
                                    self.navigateToBoard = true
                                }, text: "Easy")
                                MenuButton(buttonAction: {
                                    self.currentAi = Medium()
                                    self.navigateToBoard = true
                                }, text: "Medium")
                                MenuButton(buttonAction: {
                                    self.currentAi = Hard()
                                    self.navigateToBoard = true
                                }, text: "Hard")
                                MenuButton(buttonAction: {showAIOptions.toggle()}, text: "Return",imageName: "arrowshape.turn.up.backward.fill")
                                NavigationLink("", destination: BoardView(currentAi), isActive: $navigateToBoard)
                                
                            
                            }
                            .padding(.bottom,45)
                            .rotation3DEffect(
                                .degrees(!showAIOptions ? 90.0:0.0),
                                axis: (x: 0.0, y: 0.0, z: 1.0),
                                anchor: .bottomLeading,
                                anchorZ: 0.0,
                                perspective: 1.0
                            )
                            .offset(x: 0, y:showAIOptions ? 0.0:35)
                            .animation(.default)
                            
                            VStack {
                                
                                MenuButton(buttonAction:{showAIOptions.toggle()}, text:"1 VS AI")
                                    .padding(.top)
                                MenuButton(buttonAction:{
                                            currentAi = nil
                                            navigateToBoard = true}, text:"1 VS 1")
                                    .padding(.bottom)
                                    .padding(.top,5)
                                
                            }
                            .rotation3DEffect(
                                .degrees(showAIOptions ? -90.0:0.0),
                                axis: (x: 0.0, y: 0.0, z: 1.0),
                                anchor: .bottomLeading,
                                anchorZ: 0.0,
                                perspective: 1.0
                            )
                            .offset(x: showAIOptions ? -50:0, y: 0)
                            
                            .animation(.default)
                        }
                        
                    }
            }
        }
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(false)
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
