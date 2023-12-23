//
//  MovieListEntity.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 22/12/2023.
//

import Foundation
import UIComponents

final class MovieListEntity {
    let title: String
    let releaseDate: String
    private let posterPath: String
        
    // MARK: Init
    init(title: String,
         releaseDate: String,
         posterPath: String) {
        self.title = title
        self.releaseDate = releaseDate
        self.posterPath = posterPath
    }
}
// MARK: Conform to MovieCellItemProtocol to Display Cell Details
extension MovieListEntity: MovieCellItemProtocol {
    var imagePath: String {
        ImagePathBuilder.buildImagePath(posterPath: posterPath)
    }
    
    var subtitle: String {
        releaseDate
    }
}
