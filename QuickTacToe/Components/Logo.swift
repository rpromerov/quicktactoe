//
//  Logo.swift
//  QuickTacToe
//
//  Created by Roberto Romero on 03-05-21.
//

import SwiftUI

struct Logo: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "grid.circle").resizable().frame(width: 45, height: 45, alignment: .center)
                Text("Quick-Tac-Toe!")
                    .font(.custom("Lobster-Regular", size: 40))
            }
            Text("By @cupriferusdev")
        }
    }
}

struct Logo_Previews: PreviewProvider {
    static var previews: some View {
        Logo()
    }
}
