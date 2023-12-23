//
//  MovieListEntity.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 22/12/2023.
//

import Foundation

final class MovieListEntity {
    let title: String
    let releaseDate: String
    private let posterPath: String
    
    var constructedPosterPath: String {
        ImagePathBuilder.buildImagePath(posterPath: posterPath)
    }
    
    // MARK: Init
    init(title: String,
         releaseDate: String,
         posterPath: String) {
        self.title = title
        self.releaseDate = releaseDate
        self.posterPath = posterPath
    }
}
