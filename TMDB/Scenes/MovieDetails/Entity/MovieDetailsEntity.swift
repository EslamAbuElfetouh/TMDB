//
//  MovieDetailsEntity.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 23/12/2023.
//

import Foundation
import UIComponents

typealias MovieDetailsViewComponentsProtocols = PosterViewItemProtocol & MovieInfoViewItemProtocol

final class MovieDetailsEntity {
    // MARK: - Properties

    let id: Int
    let title: String
    let releaseDate: String
    let overview: String
    let ratings: Double
    private let posterPathSuffix: String
    private let backdropPathSuffix: String

    // MARK: - Init

    init(
        id: Int,
        title: String,
        releaseDate: String,
        overview: String,
        posterPathSuffix: String,
        backdropPathSuffix: String,
        ratings: Double
    ) {
        self.id = id
        self.title = title
        self.releaseDate = releaseDate
        self.overview = overview
        self.posterPathSuffix = posterPathSuffix
        self.backdropPathSuffix = backdropPathSuffix
        self.ratings = ratings
    }
}

// MARK: - Conforming to MovieDetailsViewComponentsProtocols

extension MovieDetailsEntity: MovieDetailsViewComponentsProtocols {
    var backdropPath: String {
        ImagePathBuilder.buildImagePath(posterPath: backdropPathSuffix)
    }

    var averageRating: String {
        ratings.formattedString()
    }
    
    var posterPath: String {
        ImagePathBuilder.buildImagePath(posterPath: posterPathSuffix)
    }
    
    var subtitle: String {
        releaseDate
    }
}
