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
    
    private let movieCellHeightToWidthRatio: CGFloat = 1.47
    
    private var movies = [MovieListEntity]()

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
    func getItem(at index: Int) -> MovieListEntity? {
        self.movies[safe: index]
    }
    
    var moviesItemsCount: Int {
        self.movies.count
    }
    
    func viewDidLoad() {
        self.interactor?.fetchMoviesList()
    }
    
    func calculateCellSize(_ collectionViewWidth: CGFloat,
                           horizontalMargin: CGFloat) -> CGSize {
        return CellSizeCalculator.calculateCellSize(collectionViewWidth: collectionViewWidth,
                                                    horizontalMargin: horizontalMargin,
                                                    itemsPerRow: 2,
                                                    cellHeightToWidthRatio: movieCellHeightToWidthRatio)
        
    }
    
    func navigateToMovieDetails(with index: Int) {
        guard let selectedMovie = self.movies[safe: index] else { return }
        self.router?.navigateToMovieDetails(for: selectedMovie)
    }
    /// To notify the interactor to fetch more data
    func userReachedEndOfScreen() {
        interactor?.fetchMoviesList()
    }
    
    func setLoadingIndicatorVisible(_ isVisible: Bool) {
        self.view?.setLoadingIndicatorVisible(isVisible)
    }
    
    func refreshMovies() {
        self.interactor?.refreshMovies()
    }
    
    func didTapFavButton() {
        self.showFavScreenNavigationOptions()
    }
}
// MARK: Conform to MovieListInteractorOutputa
extension MovieListPresenter: MovieListInteractorOutput {
    func didFetchMovies(_ movies: [MovieListEntity], isFirstPage: Bool) {
        isFirstPage ? self.movies = movies : self.movies.append(contentsOf: movies)
        self.view?.reloadCollectionView()
    }
    
    func stopRefreshingIndicator() {
        self.view?.stopRefreshingIndicator()
    }
    
    func didFailToFetchMovies(with error: Error) {
        self.view?.presentError(with: error.localizedDescription)
    }
}
// MARK: - Helper - Handle Favorite button action
extension MovieListPresenter {
    // Show Bottom Sheet Alert for the user to select either static or remote movie list.
    private func showFavScreenNavigationOptions() {
        let alertActions = createFavScreenActionSheetActions()
        let configuration = AlertConfiguration(title: "Choose an Option",
                                               message: "What would you like to do?",
                                               actions: alertActions)
        view?.showActionSheetAlert(with: configuration)
    }
    
    private func createFavScreenActionSheetActions() -> [UIAlertAction] {
        [
            UIAlertAction(title: "Static Movie List", style: .default) { [weak self] _ in
                // Handle the selection of static movie list
                self?.router?.navigateToFavoriteScreen(withStaticData: true)
            },
            UIAlertAction(title: "Remote Movie List", style: .default) { [weak self] _ in
                // Handle the selection of remote movie list
                self?.router?.navigateToFavoriteScreen(withStaticData: false)
            },
            UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        ]
    }
}
