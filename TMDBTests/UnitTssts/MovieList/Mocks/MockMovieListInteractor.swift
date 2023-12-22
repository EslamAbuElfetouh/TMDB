//
//  MockMovieListInteractor.swift
//  TMDBTests
//
//  Created by Eslam Abo El Fetouh on 22/12/2023.
//

import Foundation
@testable import TMDB

class MockMovieListInteractor: MovieListPresenterInteractorProtocol {
    // MARK: Properties
    var fetchMoviesCallsCount = 0

    func fetchMovies() {
        fetchMoviesCallsCount += 1
    }
}

