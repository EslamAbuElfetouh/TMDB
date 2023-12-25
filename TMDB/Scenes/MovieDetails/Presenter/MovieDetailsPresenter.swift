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
    private var movieDetailsInput: MovieDetailsBuilderInput
    // MARK: - Init
    init(view: MovieDetailsControllerProtocol?,
         interactor: MovieDetailsPresenterInteractorProtocol?,
         router: MovieDetailsRouterProtocol?,
         movieDetailsInput: MovieDetailsBuilderInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.movieDetailsInput = movieDetailsInput
    }
}
// MARK: Conform to MovieDetailsPresenterProtocol
extension MovieDetailsPresenter: MovieDetailsPresenterProtocol {
    func viewDidLoad() {
        interactor?.fetchMovieDetails(with: movieDetailsInput.id)
    }
    
    func didFetchMovieDetails(_ movie: MovieDetailsEntity) {
        // Config needed UI Components
        self.view?.configBackdropView(with: movie)
        self.view?.configMovieInfoView(with: movie)
        self.view?.configSummary(with: movie.overview)
    }
    
    func popViewController() {
        self.router?.popViewController()
    }
}
// MARK: Conform to MovieDetailsInteractorOutputa
extension MovieDetailsPresenter: MovieDetailsInteractorOutput {
    func didFailToFetchMovieDetails(with error: Error) {
        self.view?.presentError(with: error.localizedDescription)
    }
    
    func startLoading() {
        self.view?.startLoading()
    }
    
    func stopLoading() {
        self.view?.stopLoading()
    }
}
