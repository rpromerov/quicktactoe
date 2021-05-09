//
//  Hard.swift
//  QuickTacToe
//
//  Created by Roberto Romero on 08-05-21.
//

import Foundation
class Hard:AIPlayer {
    let humanPlayer = 1
    let aiPlayer = 2
    func winning(board:[Int],player:Int) -> Bool{
        //Board length is always 9
            //check for winning rows
            for row in 0..<3{
                var playerSet:Set<Int> = Set()
                for col in 0..<3{
                    let coord = col + row*3
                    playerSet.insert(board[coord])
                }
                
                if (playerSet.contains(player) && playerSet.count == 1 && !(playerSet.contains(0))){
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
                if (playerSet.contains(player) && playerSet.count == 1 && !(playerSet.contains(0))){
                    return true
                }
            }
            //check for winning diagonals
            var playerSet:Set<Int> = Set()
            for coord in [0,4,8] {
                
                playerSet.insert(board[coord])
                
            }
            if (playerSet.contains(player) && playerSet.count == 1 && !(playerSet.contains(0))){
                return true
            }
            playerSet = Set()
            for coord in [2,4,6] {
                
                playerSet.insert(board[coord])
                
            }
            if (playerSet.contains(player) && playerSet.count == 1 && !(playerSet.contains(0))){
                return true
            }
            return false
                
            
    }
    func emptyIndices(board:[Int])->[Int]{
        var emptySpots = [Int]()
        for i in 0..<9 {
            if (board[i] == 0){
                emptySpots.append(i)
            }
        }
        return emptySpots
    }
    
    
    func minimax(newBoard:[Int],player:Int) -> [String:Int]{
        var newerBoard = newBoard
        let avaibleSpots = emptyIndices(board: newBoard)
        if (winning(board: newBoard, player: humanPlayer)){
            return ["score":-10]
        }else if (winning(board: newBoard, player: aiPlayer)){
            return ["score":10]
        }else if (avaibleSpots.count == 0){
            return ["score":0]
        }
        var moves = [[String:Int]]()
        for index in avaibleSpots {
            var move = ["index":index,"score":0]
            newerBoard[index] = player
            
            if (player == aiPlayer){
                let g = minimax(newBoard: newerBoard, player: humanPlayer)
                move["score"] = g["score"]
            }else {
                let g = minimax(newBoard: newerBoard, player: aiPlayer)
                
                move["score"] =  g["score"]
            }
            newerBoard[index] = 0
            moves.append(move)
            
        }
        
        var bestMove:Int = -1
        var bestScoreMeta = 0
        if (player == aiPlayer){
            var bestScore = -10000
            for move in moves{
                if (move["score"]! > bestScore){
                    bestScoreMeta = move["score"]!
                    bestScore = move["score"]!
                    bestMove = move["index"]!
                }
            }
        }else {
            var bestScore = 10000
            for move in moves{
                if (move["score"]! < bestScore){
                    bestScoreMeta = move["score"]!
                    bestScore = move["score"]!
                    bestMove = move["index"]!
                }
            }
        }
        return ["index":bestMove,"score":bestScoreMeta]
    }
    
    func getMove(board: [Int]) -> [Int] {
        var newBoard = board
        if emptyIndices(board: newBoard).count < 9 {
            let index = minimax(newBoard: board, player: aiPlayer)["index"]
            newBoard[index!] = 2
            return newBoard
        }else {
            newBoard[emptyIndices(board: newBoard).randomElement()!] = 2
            return newBoard
        }
        
    }
    
    
}
