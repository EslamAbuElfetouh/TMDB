//
//  MockMovieListRouter.swift
//  TMDBTests
//
//  Created by Eslam Abo El Fetouh on 22/12/2023.
//

import Foundation
@testable import TMDB

final class MockMovieListRouter: MovieListRouterProtocol {
    // MARK: - Properties

    var navigateToMoviesCallsCount = 0

    func navigateToMovieDetails(for movie: MovieDetailsBuilderInput) {
        navigateToMoviesCallsCount += 1
    }
    
    func navigateToFavoriteScreen(withStaticData isStatic: Bool) {
        // Do nothing
    }
}
