//
//  movieSearchItemCellReducted.swift
//  tvmaze
//
//  Created by Tanvir Rahman on 04.05.2023.
//

import Foundation
import SwiftUI
struct movieSearchItemsCellReducted: View {
    var body: some View {
            HStack(alignment: .center){
                    Image(systemName: "ipad.gen1.landscape.badge.play")
                    .resizable()
                    .frame(width: 100, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                VStack(alignment: .leading){
                    Text("Name: Not available")
                    Text("Ratings: Not available")
                    Text("Type: Not available")
                }
                
                Spacer()
            }.padding(10)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.secondary, lineWidth: 1)
            )
            .padding(10)
            .redacted(reason: .placeholder)
    }
}
