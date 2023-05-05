//
//  movieDetailView.swift
//  tvmaze
//
//  Created by Tanvir Rahman on 02.05.2023.
//

import SwiftUI
import SDWebImageSwiftUI
struct movieDetailView: View {
    var id: String
    @StateObject var movieDetailData = movieDetailsViewModel()
    var body: some View {
        ZStack{
            if movieDetailData.responseCode == -1 {
                movieDetailViewReducted()
            }else {
                ScrollView{
                    VStack{
                        VStack(spacing: 10){
                            WebImage(url: URL(string: movieDetailData.movieData.imageURL ?? " " ))
                                .placeholder(
                                    Image(systemName: "photo.circle.fill")
                                        .resizable()
                                )
                                .resizable()
                                .frame(width: 120, height: 180, alignment: .center)
                            Text(movieDetailData.movieData.name ?? " " )
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
                                Text("**Summary**: \(movieDetailData.movieData.summary?.replacingOccurrences(of: "<p>", with: " ") ?? " " )")
                                Text("**Ratings**: \(String(movieDetailData.movieData.rating ?? 0.0))")
                                Text("**Language**: \(movieDetailData.movieData.language ?? " " )")
                                Text("**Genres**: \(movieDetailData.movieData.genres ?? " ")")
                                Text("**Premiered**: \(stringToDate(dateStr: movieDetailData.movieData.premired ?? "1911-02-09").formatDate(format: "E, d MMM yyy"))")
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
            }
        }.onAppear{
           movieDetailData.searchMovieID(movieID: id)
        }
    }
}

struct movieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        movieDetailView(id: "")
    }
}
