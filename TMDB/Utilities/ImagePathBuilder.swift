//
//  ImagePathBuilder.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 24/12/2023.
//

import Foundation

class ImagePathBuilder {
    static func buildImagePath(posterPath: String) -> String {
        Constants.baseImageURL + posterPath
    }
}
