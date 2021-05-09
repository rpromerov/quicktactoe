//
//  AIPlayer.swift
//  QuickTacToe
//
//  Created by Roberto Romero on 08-05-21.
//

import Foundation

protocol AIPlayer {
    func getMove(board: [Int])->[Int]
}
