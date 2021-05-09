//
//  Easy.swift
//  QuickTacToe
//
//  Created by Roberto Romero on 08-05-21.
//

import Foundation
class EasyAI:AIPlayer {
    func getMove(board: [Int]) -> [Int] {
        var newBoard = board
        var avaibleCoords:[Int] = []
        for i in 0..<board.count{
            if (board[i] == 0){
                avaibleCoords.append(i)
            }
        }
        if let avaibleCoord = avaibleCoords.randomElement(){
            newBoard[avaibleCoord] = 2
            return newBoard
        }
        return board
        
    }
    
    
}
