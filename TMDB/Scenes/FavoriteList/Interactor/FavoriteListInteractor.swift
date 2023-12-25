//
//  FavoriteListInteractor.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 25/12/2023.
//

import UIKit

class FavoriteListInteractor {

    var presenter: FavoriteListInteractorOutput?
    private let movieLoader: FavoriteListLoaderProtocol
    
    init(loader: FavoriteListLoaderProtocol) {
        self.movieLoader = loader
    }
}
extension FavoriteListInteractor: FavoriteListPresenterInteractorProtocol {

}

