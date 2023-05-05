//
//  movieDetailViewReducted.swift
//  tvmaze
//
//  Created by Tanvir Rahman on 03.05.2023.
//


import SwiftUI

struct movieDetailViewReducted: View {
    
    @State private var name: String = "Fighter"
    @State private var ratings: String = "7.6"
    @State private var genres: String = "Drama, Action, Fight"
    @State private var language: String = "Korean"
    @State private var premieredDate: String = "12 Jan 2022"
    @State private var countryName: String = "Bangladesh"
    @State private var summary: String = "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum!"
    @StateObject var movieDetailData = movieDetailsViewModel()
    var body: some View {
        ScrollView{
            VStack{
                VStack(spacing: 10){
                    Image(systemName: "photo.circle.fill")
                        .resizable()
                        .foregroundColor(.secondary)
                        .frame(width: 120, height: 180, alignment: .center)
                    Text("Fighter")
                        .bold()
                        .italic()
                        .foregroundColor(.secondary)
                }.padding(15)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.secondary, lineWidth: 1)
                    )
                Divider()
                    .padding()
                HStack{
                    VStack(alignment: .leading, spacing: 10){
                        Text("**Summary**: \(summary)")
                        Text("**Ratings**: \(ratings)")
                        Text("**Language**: \(language)")
                        Text("**Genres**: \(genres)")
                        Text("**Premiered**: \(premieredDate)")
                    }.padding()
                    Spacer()
                }
                Spacer()
            }.padding(.vertical)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.secondary, lineWidth: 1)
                ).padding(.horizontal, 5)
        }
        .redacted(reason: .placeholder)
    }
}
