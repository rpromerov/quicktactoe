//
//  BoardTile.swift
//  QuickTacToe
//
//  Created by Roberto Romero on 04-05-21.
//

import SwiftUI

struct BoardTile: View {
    @Binding var player:Int
    var tileText:String {
        switch player {
        case 0:
            return " "
        case 1:
            return "circlebadge"
        case 2:
            return "xmark"
        default:
            return ""
        }
    }
    var body: some View {
        Circle()
            .stroke(lineWidth: 5)
            .background(Color.appMainOrange.clipShape(Circle()))
            .frame(width: 100, height: 100, alignment: .center)
            .overlay(Image(systemName: tileText).resizable().frame(width: 50, height: 50, alignment: .center))
    }
}


