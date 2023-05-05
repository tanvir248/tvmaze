//
//  searchMovieViewModel.swift
//  tvmaze
//
//  Created by Tanvir Rahman on 04.05.2023.
//

import Foundation
import Alamofire
import PMJSON

class searchMovieViewModel: ObservableObject{
    @Published var searchData: [Movie] = []
    @Published var responseCode: Int = -1
    
    func searchMovie(searchText: String){
    
        let url = URL(string:"https://api.tvmaze.com/search/shows?q=\(searchText.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")")
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
        
        searchData = []
        var movieType : String = ""
        let json = try? JSON.decode(data)
        for i in 0..<20 {
            
            let name = try? json?[i]?.getObject("show").getString("name")
            let movieID = try? json?[i]?.getObject("show").getInt("id")
            let imageURL = try? json?[i]?.getObject("show").getObject("image").getString("medium")
            let ratings = try? json?[i]?.getObject("show").getObject("rating").getDouble("average")
            
            if let type = try? json?[i]?.getObject("show").getArray("genres") {
                if type.count > 0 {
                    
                    movieType = "\(type[0])"
                }else {
                    movieType = "Not Available"
                }
            }else {
                movieType = "Not Available"
            }
            let value = Movie(
                              id: movieID,
                              imageURL: imageURL,
                              name: name,
                              summary: "",
                              rating: ratings,
                              language: "",
                              genres: movieType,
                              premired: ""
                              )
            
            self.searchData.append(value)
            
            if let _ = try? json?[i+1]?.getObject("show") {
                continue
            }else{
                break
            }
        }
        self.responseCode = 200
    }
    
}
