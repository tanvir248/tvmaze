//
//  movieDetailsViewModel.swift
//  tvmaze
//
//  Created by Tanvir Rahman on 04.05.2023.
//

import Foundation
import Alamofire
import PMJSON

class movieDetailsViewModel: ObservableObject{
    @Published var movieData: Movie!
    @Published var responseCode: Int = -1
    func searchMovieID(movieID: String){
        
        let url = URL(string:"https://api.tvmaze.com/shows/\(movieID)")
        let  headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Accept": "application/json", ]
        AF.request(url!, method: .get, headers: headers)
            .responseString { response in
                
                if response.response?.statusCode == 200 {
                    let _ = self.datamodel(data: response.value!)
                    
                }else{
                    print("Error to find movie")
                    self.responseCode = response.response?.statusCode ?? 0
                }
                
            }
    }
    func datamodel(data: String){
        
        var movieType : String = ""
        let json = try? JSON.decode(data)
        let name = try? json?.getString("name")
        let imageURL = try? json?.getObject("image").getString("medium")
        let ratings = try? json?.getObject("rating").getDouble("average")
        let summary = try? json?.getString("summary").replacingOccurrences(of: "</b>", with: " ")
        let language = try? json?.getString("language")
        let premiered = try? json?.getString("premiered")
        if let type = try? json?.getArray("genres") {
            if type.count > 0 {
                for i in type {
                    movieType += "\(i), "
                }
                
            }else {
                movieType = "Not Available"
            }
        }else {
            movieType = "Not Available"
        }
        self.movieData = Movie(id: 0,imageURL: imageURL, name: name, summary: summary, rating: ratings, language: language, genres: movieType, premired: premiered)
        self.responseCode = 200
    }
    
}
