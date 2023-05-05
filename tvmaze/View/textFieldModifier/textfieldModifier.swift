//
//  textfieldExtensions.swift
//  tvmaze
//
//  Created by Tanvir Rahman on 02.05.2023.
//

import SwiftUI

extension View {
    func bigTextField(isRedBorder: Bool) -> some View {
        modifier(bigTextFieldViewModifier(isRed: isRedBorder))
    }
}
struct bigTextFieldViewModifier: ViewModifier {
    var isRed: Bool
    func body(content: Content) -> some View {
        content
            .frame(height: 40)
            .padding(8)
            .background(
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .stroke(isRed ? .red : Color.gray.opacity(0.5), lineWidth: 1)
            )
            .padding(.horizontal, 10)
    }
}

