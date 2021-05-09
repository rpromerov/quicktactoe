//
//  DifficultyButton.swift
//  QuickTacToe
//
//  Created by Roberto Romero on 03-05-21.
//

import SwiftUI

struct MenuButton: View {
    var buttonAction:()->Void
    var text:String
    var imageName:String
    var textScale:Double
    
    init(buttonAction:@escaping ()->Void,text:String,imageName:String = "",textScale:Double = 1.0) {
        self.buttonAction = buttonAction
        self.text = text
        self.imageName = imageName
        self.textScale = textScale
        
    }
    
    var body: some View {
        Button(action: buttonAction) {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .stroke(lineWidth: 3)
                .foregroundColor(.black)
                .background(Color.appMainOrange.clipShape(RoundedRectangle(cornerRadius: 25)))
                .frame(width: 250, height: 75, alignment: .center)
                .overlay(
                    HStack {
                        Image(systemName: imageName)
                            .foregroundColor(.black)
                            
                        Text(text)
                            .foregroundColor(.black)
                            .font(.title2)
                            
                    }
                    .scaleEffect(CGFloat(textScale))
                )
            
                
    }
        
    }
}


