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
}
