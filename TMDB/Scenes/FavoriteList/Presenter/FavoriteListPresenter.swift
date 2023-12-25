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
    
    private let movieCellHeightToWidthRatio: CGFloat = 1.47
    private var movies = [FavoriteListEntity]()
    
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
    func calculateCellSize(_ collectionViewWidth: CGFloat,
                           horizontalMargin: CGFloat) -> CGSize {
        return CellSizeCalculator.calculateCellSize(collectionViewWidth: collectionViewWidth,
                                                    horizontalMargin: horizontalMargin,
                                                    itemsPerRow: 2,
                                                    cellHeightToWidthRatio: movieCellHeightToWidthRatio)
    }
    
    var moviesItemsCount: Int {
        self.movies.count
    }
    
    func viewDidLoad() {
        interactor?.fetchMoviesList()
    }
    
    func getItem(at index: Int) -> MovieListEntity? {
        self.movies[safe: index]
    }
    
    func navigateToMovieDetails(with index: Int) {
        guard let selectedMovie = self.movies[safe: index] else { return }
        self.router?.navigateToMovieDetails(for: selectedMovie)
    }
    
    func popViewController() {
        self.router?.popViewController()
    }
}
// MARK: Conform to FavoriteListInteractorOutputa
extension FavoriteListPresenter: FavoriteListInteractorOutput {
    func didFetchMovies(_ movies: [FavoriteListEntity]) {
        self.movies = movies
        view?.reloadCollectionView()
    }
    
    func showErrorAlert(with message: String) {
        view?.showAlert(title: "Error",
                        message: message,
                        preferredStyle: .alert,
                        alertActionTitle: "Ok",
                        completionHandler: .none)
    }
    
    func startLoading() {
        view?.startLoading()
    }
    
    func stopLoading() {
        view?.stopLoading()
    }
}
