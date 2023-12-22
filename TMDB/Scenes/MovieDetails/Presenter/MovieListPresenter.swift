//
//  MovieListPresenter.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 22/12/2023.
//

import UIKit

final class MovieListPresenter: NSObject {
    // MARK: - Properites
    private var view: MovieListControllerProtocol?
    private var interactor: MovieListPresenterInteractorProtocol?
    private var router: MovieListRouterProtocol?
    
    // MARK: - Init
    init(view: MovieListControllerProtocol?,
         interactor: MovieListPresenterInteractorProtocol?,
         router: MovieListRouterProtocol?) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}
// MARK: Conform to MovieListPresenterProtocol
extension MovieListPresenter: MovieListPresenterProtocol {
    func viewDidLoad() {
        
    }
}
// MARK: Conform to MovieListInteractorOutputa
extension MovieListPresenter: MovieListInteractorOutput {
}
