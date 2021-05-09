//
//  BoardModel.swift
//  QuickTacToe
//
//  Created by Roberto Romero on 06-05-21.
//

import Foundation

class BoardModel {
    func isDraw(board:[Int]) -> Bool {
        if board.allSatisfy({ (number) -> Bool in
            return number != 0
        }){
            return true
        }
        return false
    }
    func isGameWon(board:[Int]) -> Bool{
    //Board length is always 9
        //check for winning rows
        for row in 0..<3{
            var playerSet:Set<Int> = Set()
            for col in 0..<3{
                let coord = col + row*3
                playerSet.insert(board[coord])
            }
            
            if (playerSet.count == 1 && !(playerSet.contains(0))){
                return true
            }
            
        }
        //check for winning columns
        for row in 0..<3{
            var playerSet:Set<Int> = Set()
            for col in 0..<3{
                let coord = row + col*3
                playerSet.insert(board[coord])
            }
            if (playerSet.count == 1 && !(playerSet.contains(0))){
                return true
            }
        }
        //check for winning diagonals
        var playerSet:Set<Int> = Set()
        for coord in [0,4,8] {
            
            playerSet.insert(board[coord])
            
        }
        if (playerSet.count == 1 && !(playerSet.contains(0))){
            return true
        }
        playerSet = Set()
        for coord in [2,4,6] {
            
            playerSet.insert(board[coord])
            
        }
        if (playerSet.count == 1 && !(playerSet.contains(0))){
            return true
        }
        return false
            
        
    }
}
