//
//  Board.swift
//  QuickTacToe
//
//  Created by Roberto Romero on 03-05-21.
//

import SwiftUI

struct BoardView: View {
    @State var tilePlayer:[Int] = [Int](repeating: 0, count: 9)
    @State var playerTurn = 1
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var gameEnded = false
    @State var isDraw = false
    @State var player1Score = 0
    @State var player2Score = 0
    let opponent:AIPlayer?
    init(_ opponent:AIPlayer?) {
        self.opponent = opponent
    }
    func checkWin() -> Bool{
        if (boardModel.isGameWon(board: tilePlayer)){
            if (playerTurn == 1){
                self.player1Score += 1
            }else {
                self.player2Score += 1
            }
            gameEnded = true
            return true
        }else {
            return false
        }
        
    }
    func opponentPlay(){
        if (gameEnded){
            return
        }
        if let opponent = opponent {
            print("Playing beep...")
            if (playerTurn == 2 ){
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.tilePlayer = opponent.getMove(board: tilePlayer)
                    
                    if !checkWin(){
                        self.playerTurn = playerTurn % 2 + 1
                    }
                    
                }
                
            }
        }
    }
   let boardModel = BoardModel()
    var body: some View {
        
        ZStack{
            Color.appBackgroundOrange
                .ignoresSafeArea()
            VStack {
                HStack {
                    MenuButton(buttonAction: {self.presentationMode.wrappedValue.dismiss()}, text: "Return", imageName:"arrowshape.turn.up.backward.fill",textScale: 1.8)
                        .scaleEffect(0.5)
                        .offset(x: -35, y: 0)
                    Spacer()
                }
                Spacer()
                HStack{
                    Text ("\(player1Score)")
                        .font(.largeTitle)
                    Spacer()
                    Text("-")
                        .font(.title)
                    Spacer()
                    Text ("\(player2Score)")
                        .font(.largeTitle)
                }.padding()
                .padding(.horizontal,40)
                Spacer()
                VStack {
                    Spacer()
                    ForEach(0..<3) { row in
                        HStack {
                            ForEach(0..<3) { column in
                                BoardTile(player: $tilePlayer[row + 3 * column])
                                    .onTapGesture {
                                        let tileIndex = row + 3 * column
                                        if (opponent != nil && playerTurn == 2 || gameEnded || tilePlayer[tileIndex] != 0){
                                            return
                                        }
                                        if (tilePlayer[tileIndex] == 0){
                                            tilePlayer[tileIndex] = playerTurn
                                            if checkWin() {
                                                return
                                            }
                                            if (boardModel.isDraw(board: tilePlayer)){
                                                isDraw = true
                                                return
                                            }
                                            
                                        }
                                        playerTurn = playerTurn % 2 + 1
                                        opponentPlay()
                                        
                                }
                            }
                        }
                    }
                    Spacer()
                }
            }
        }
        .overlay(
            
            VStack {
                if gameEnded || isDraw{
                    HStack{
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.black, lineWidth: 5)
                    .frame(width: 300, height: 200, alignment: .center)
                    .background(Color.appAccentColor.clipShape(RoundedRectangle(cornerRadius: 25)).opacity(0.9))
                    .overlay(
                        VStack {
                            Text(isDraw ? "It's a draw!":"Player \(playerTurn) Won!").font(.largeTitle)
                        HStack {
                            MenuButton(buttonAction: {
                                self.presentationMode.wrappedValue.dismiss()
                            }, text: "Quit",textScale: 2)
                                .scaleEffect(0.5)
                                .offset(x: 60, y: 20)
                            MenuButton(buttonAction: {
                                self.tilePlayer = [Int](repeating: 0, count: 9)
                                self.playerTurn = 1
                                self.gameEnded = false
                                self.isDraw = false
                            }, text: "Try again",textScale: 2)
                                .scaleEffect(0.5)
                                .offset(x: -60, y: 20)
                        }
                    }
                        
                    
                    )
                    }
                } else {
                    EmptyView()
                }
            })
        .navigationBarHidden(true)
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView(nil)
    }
}
