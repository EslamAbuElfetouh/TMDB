//
//  MovieDetailsPresenter.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 23/12/2023.
//

import UIKit

final class MovieDetailsPresenter: NSObject {
    // MARK: - Properites
    private var view: MovieDetailsControllerProtocol?
    private var interactor: MovieDetailsPresenterInteractorProtocol?
    private var router: MovieDetailsRouterProtocol?

    // MARK: - Init
    init(view: MovieDetailsControllerProtocol?,
         interactor: MovieDetailsPresenterInteractorProtocol?,
         router: MovieDetailsRouterProtocol?) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}
// MARK: Conform to MovieDetailsPresenterProtocol
extension MovieDetailsPresenter: MovieDetailsPresenterProtocol {
    func viewDidLoad() {
        
    }
    
    func popViewController() {
        self.router?.popViewController()
    }
}
// MARK: Conform to MovieDetailsInteractorOutputa
extension MovieDetailsPresenter: MovieDetailsInteractorOutput {
}
