//
//  MovieDetailsRouter.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 23/12/2023.
//

import UIKit

class MovieDetailsRouter {
    weak var viewController: MovieDetailsViewController?

    // MARK: - Init
    init(viewController: MovieDetailsViewController) {
        self.viewController = viewController
    }
}
// MARK: Conforming to MovieDetailsRouterProtocol
extension MovieDetailsRouter: MovieDetailsRouterProtocol {
    func popViewController() {
        self.viewController?.navigationController?.popViewController(animated: true)
    }
}
