//
//  TestDataBuilder.swift
//  TMDBTests
//
//  Created by Eslam Abo El Fetouh on 24/12/2023.
//

import Foundation
import NetworkKit
@testable import TMDB

class TestDataBuilder {
    static func createMovieResponse() -> MovieResponse {
        return MovieResponse(page: 1, results: [createSampleMovie()], totalPages: 1, totalResults: 1)
    }
    
    static func createSampleMovie() -> Movie {
        return Movie(title: "Movie 1", releaseDate: "2023-01-01", posterPath: "/path")
    }
    
    static func createMoviesListEntities() -> [MovieListEntity] {
        [
            MovieListEntity(title: "Movie 1", releaseDate: "2023-01-01", posterPath: "/path"),
            MovieListEntity(title: "Movie 2", releaseDate: "2023-01-02", posterPath: "/path"),
            MovieListEntity(title: "Movie 3", releaseDate: "2023-01-03", posterPath: "/path")
        ]
    }
    
}
