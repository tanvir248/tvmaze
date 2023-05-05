//
//  dateFormatter.swift
//  tvmaze
//
//  Created by Tanvir Rahman on 04.05.2023.
//

import Foundation
extension Date {
    func formatDate(format : String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.string(from: self)
    }
}
