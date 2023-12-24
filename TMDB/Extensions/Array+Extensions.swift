//
//  Array+Extensions.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 24/12/2023.
//

import Foundation

extension Array {
    /// Subscript that returns nil instead of crashing when accessing an out-of-bounds index.
    subscript(safe index: Int) -> Element? {
        get {
            return indices ~= index ? self[index] : nil
        }
        set {
            if let newValue = newValue, indices ~= index {
                self[index] = newValue
            }
        }
    }
}
