//
//  Numeric+Extension.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 24/12/2023.
//

import Foundation

extension Numeric {
    var stringValue: String {
        return String(describing: self)
    }
}

extension Double {
    func formattedString(withDecimalPlaces places: Int = 1) -> String {
        return String(format: "%.\(places)f", self)
    }
}
