//
//  Medium.swift
//  QuickTacToe
//
//  Created by Roberto Romero on 08-05-21.
//

import Foundation
class Medium: AIPlayer {
    func checkPossibleWin(board: [Int]) -> Int?{
        //It's a modified version of checkWin
        //Gets the best option, be it block a win or win
        //Board length is always 9
            //check for winning rows
        print("Checking win")
        
            for row in 0..<3{
                var colPlayerSum = 0
                var playerSet:Set<Int> = Set()
                var winCoord:Int = -1
                for col in 0..<3{
                    let coord = col + row*3
                    playerSet.insert(board[coord])
                    colPlayerSum += board[coord]
                    if (board[coord] == 0){
                        winCoord = coord
                    }
                }
                print(playerSet)
                
                if (colPlayerSum == 4 && playerSet.count == 2 && !(playerSet.contains(1))){
                    return winCoord
                }
                
            }
            //check for winning columns
            for row in 0..<3{
                var rowSum = 0
                var playerSet:Set<Int> = Set()
                var winCoord:Int = -1
                for col in 0..<3{
                    let coord = row + col*3
                    playerSet.insert(board[coord])
                    if (board[coord] == 0){
                        winCoord = coord
                    }
                    rowSum += board[coord]
                }
                if (rowSum == 4 && playerSet.count == 2 && !(playerSet.contains(1))){
                    return winCoord
                }
            }
            //check for winning diagonals
            var playerSet:Set<Int> = Set()
            var winCoord = -1
        var diagSum = 0
            for coord in [0,4,8] {
                if (board[coord] == 0){
                    winCoord = coord
                }
                diagSum += board[coord]
                playerSet.insert(board[coord])
                
            }
        if (diagSum == 4 && playerSet.count == 2 && !(playerSet.contains(1))){
            return winCoord
        }
            playerSet = Set()
        winCoord = -1
        diagSum = 0
            for coord in [2,4,6] {
                if (board[coord] == 0){
                    winCoord = coord
                }
                playerSet.insert(board[coord])
                diagSum += board[coord]
                
            }
        if (diagSum == 4 && playerSet.count == 2 && !(playerSet.contains(1))){
            return winCoord
        }
            return nil
                
            
    }
    func checkPossibleBlock(board: [Int]) -> Int?{
        //It's a modified version of checkWin
        //Gets the best option, be it block a win or win
        //Board length is always 9
            //check for winning rows
            for row in 0..<3{
                var rowSum = 0
                var playerSet:Set<Int> = Set()
                var winCoord:Int = -1
                for col in 0..<3{
                    let coord = col + row*3
                    print(board[coord])
                    playerSet.insert(board[coord])
                    if (board[coord] == 0){
                        winCoord = coord
                    }
                    rowSum += board[coord]
                }
                
                if (rowSum == 2 && playerSet.count == 2 && !(playerSet.contains(2))){
                    return winCoord
                }
                
            }
            //check for winning columns
            for row in 0..<3{
                var rowSum = 0
                var playerSet:Set<Int> = Set()
                var winCoord:Int = -1
                for col in 0..<3{
                    let coord = row + col*3
                    playerSet.insert(board[coord])
                    if (board[coord] == 0){
                        winCoord = coord
                    }
                    rowSum += board[coord]
                }
                if (rowSum == 2 && playerSet.count == 2 && !(playerSet.contains(2))){
                    return winCoord
                }
            }
            //check for winning diagonals
            var playerSet:Set<Int> = Set()
            var winCoord = -1
        var diagSum = 0
            for coord in [0,4,8] {
                
                playerSet.insert(board[coord])
                if (board[coord] == 0){
                    winCoord = coord
                }
                diagSum += board[coord]
                
            }
        if (diagSum == 2 && playerSet.count == 2 && !(playerSet.contains(2))){
            return winCoord
        }
            playerSet = Set()
        winCoord = -1
        diagSum = 0
            for coord in [2,4,6] {
                
                playerSet.insert(board[coord])
                if (board[coord] == 0){
                    winCoord = coord
                }
                diagSum += board[coord]
                
            }
        if (diagSum == 2 && playerSet.count == 2 && !(playerSet.contains(2))){
            return winCoord
        }
            return nil
                
            
    }
    
    func getMove(board: [Int]) -> [Int] {
        var newBoard = board
        if let winningMove = checkPossibleWin(board: board){
            print("Winning coord:\(winningMove)")
            newBoard[winningMove] = 2
            return newBoard
        }else if let blockingMove = checkPossibleBlock(board: board){
            newBoard[blockingMove] = 2
            return newBoard
        }else {
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
        }
        return board
    }
    
    
}
