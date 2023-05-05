//
//  movieDetailContoller.swift
//  tvmaze
//
//  Created by Tanvir Rahman on 03.05.2023.
//


import Foundation
import Alamofire
import PMJSON

struct Movie {
    let id: Int?
    let imageURL: String?
    let name: String?
    let summary: String?
    let rating: Double?
    let language: String?
    let genres: String?
    let premired: String?
}
