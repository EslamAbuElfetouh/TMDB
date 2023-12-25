//
//  FavoriteListPresenter.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 25/12/2023.
//

import UIKit

final class FavoriteListPresenter: NSObject {
    // MARK: - Properites
    private var view: FavoriteListControllerProtocol?
    private var interactor: FavoriteListPresenterInteractorProtocol?
    private var router: FavoriteListRouterProtocol?

    // MARK: - Init
    init(view: FavoriteListControllerProtocol?,
         interactor: FavoriteListPresenterInteractorProtocol?,
         router: FavoriteListRouterProtocol?) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}
// MARK: Conform to FavoriteListPresenterProtocol
extension FavoriteListPresenter: FavoriteListPresenterProtocol {
    func viewDidLoad() {
        
    }
}
// MARK: Conform to FavoriteListInteractorOutputa
extension FavoriteListPresenter: FavoriteListInteractorOutput {
}
