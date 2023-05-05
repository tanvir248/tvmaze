//
//  buttonsExtension.swift
//  tvmaze
//
//  Created by Tanvir Rahman on 02.05.2023.
//

import SwiftUI

struct largeButton: View {
    var text : String
    var color: Color
    var textColor: Color = .white
    
    var body: some View {
        
            Rectangle()
            
            .frame( height: 54, alignment: .center)
            .shadow(color: .black.opacity(0.3), radius: 3)
            .foregroundColor(color)
                .overlay(
                    Text(text)
                    .foregroundColor(textColor)
                    .font(.system(size: 21, weight: .semibold, design: .default))
                ).cornerRadius(5)
                 .padding(.horizontal, 10)
        }
}




