//
//  MockDiscoverMoviesLoader.swift
//  TMDBTests
//
//  Created by Eslam Abo El Fetouh on 24/12/2023.
//

import Foundation
import NetworkKit
@testable import TMDB

final class MockDiscoverMoviesLoader: DiscoverMoviesLoaderProtocol {
  // MARK: Properites
    var loadMoviesCallsCount = 0
    var expectedResult: Result<MovieResponse, Error>?
    
    func loadMovies(with parameters: DiscoverMovieRequest,
                    completionHandler: @escaping (Result<MovieResponse, Error>) -> Void) {
        loadMoviesCallsCount += 1
        guard let result = expectedResult else {
            completionHandler(.failure(APIError.didnotSetExpectedResult))
            return
        }
        completionHandler(result)
    }
}
