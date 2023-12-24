//
//  MockDiscoverMoviesLoader.swift
//  TMDBTests
//
//  Created by Eslam Abo El Fetouh on 24/12/2023.
//

import Foundation
import NetworkKit
import NetworkLayer
@testable import TMDB

final class MockDiscoverMoviesLoader: DiscoverMoviesLoaderProtocol {
  // MARK: Properites
    var loadMoviesCallsCount = 0
    var expectedResult: APIResult<MovieResponse>?
    
    func loadMovies(with parameters: NetworkKit.DiscoverMovieRequest,
                    completionHandler: @escaping (APIResult<MovieResponse>) -> Void) {
        loadMoviesCallsCount += 1
        guard let result = expectedResult else {
            completionHandler(.failure(APIError.didnotSetExpectedResult))
            return
        }
        completionHandler(result)
    }
}
