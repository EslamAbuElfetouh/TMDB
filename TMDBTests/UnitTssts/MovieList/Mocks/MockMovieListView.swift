//
//  MockMovieListView.swift
//  TMDBTests
//
//  Created by Eslam Abo El Fetouh on 22/12/2023.
//

import Foundation
@testable import TMDB

class MockMovieListView: MovieListControllerProtocol {
    // MARK: Properties
    var updateMoviesCallsCount = 0
    
    func updateMovies() {
        updateMoviesCallsCount += 1
    }
}
