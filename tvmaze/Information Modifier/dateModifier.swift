//
//  dateModifier.swift
//  tvmaze
//
//  Created by Tanvir Rahman on 04.05.2023.
//

import Foundation

func stringToDate(dateStr: String) -> Date{
  //  print(dateStr)
    let dateFormatter = DateFormatter()
  
    dateFormatter.dateFormat = "yyyy-MM-dd"
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    if let date = dateFormatter.date(from:dateStr) {
        
        return date
    }
    return Date()
}
