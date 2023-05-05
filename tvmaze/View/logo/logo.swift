//
//  logo.swift
//  tvmaze
//
//  Created by Tanvir Rahman on 02.05.2023.
//

import SwiftUI

struct logo: View {
    var body: some View {
        Image(systemName: "restart.circle.fill")
            .foregroundColor(.secondary)
            .padding()
            .font(.system(size: 100))
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
            )
    }
}

struct logo_Previews: PreviewProvider {
    static var previews: some View {
        logo()
    }
}
