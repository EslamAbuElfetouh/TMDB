//
//  MovieListRouter.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 22/12/2023.
//

import UIKit

class MovieListRouter {
    weak var viewController: MovieListViewController?

    // MARK: - Init
    init(viewController: MovieListViewController) {
        self.viewController = viewController
    }
}
// MARK: Conforming to MovieListRouterProtocol
extension MovieListRouter: MovieListRouterProtocol {
    func navigateToMovieDetails() {
    }
}
