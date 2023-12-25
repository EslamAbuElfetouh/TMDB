//
//  FavoriteListRouter.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 25/12/2023.
//

import UIKit

class FavoriteListRouter {
    weak var viewController: FavoriteListViewController?

    // MARK: - Init
    init(viewController: FavoriteListViewController) {
        self.viewController = viewController
    }
}
// MARK: Conforming to FavoriteListRouterProtocol
extension FavoriteListRouter: FavoriteListRouterProtocol {
    func popViewController() {
        self.viewController?.navigationController?.popViewController(animated: true)
    }
    
    func navigateToMovieDetails(for movie: MovieDetailsBuilderInput) {
        let vc = MovieDetailsConfigurator.viewController(input: .init(id: movie.id))
        self.viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
