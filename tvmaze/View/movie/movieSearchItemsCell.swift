//
//  movieSearchItemsCell.swift
//  tvmaze
//
//  Created by Tanvir Rahman on 02.05.2023.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct movieSearchItemsCell: View {
    var movie: Movie?
    var body: some View {
        
            HStack(alignment: .center){
                WebImage(url: URL(string: movie?.imageURL ?? "Not available"))
                    .placeholder(
                    Image(systemName: "ipad.gen1.landscape.badge.play")
                    )
                    .resizable()
                    .frame(width: 100, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                VStack(alignment: .leading){
                    Text("Name: \(movie?.name ?? "Not available")")
                    Text("Ratings: \(String(movie?.rating ?? 0.0))")
                    Text("Type: \(movie?.genres ?? "Not available")")
                }
                
                Spacer()
            }.padding(10)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.secondary, lineWidth: 1)
            )
            .padding(10)
    }
}
