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
    private let loadingDataText = "Loading data..."
    private let errorPlaceHolderText = "No Data to Present"
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
        // Show PlaceHolder label during loading data
        handleShowingEmptyListPlaceHolder(with: loadingDataText)
        // Load Data
        interactor?.fetchMoviesList()
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
        guard isVisible else {
            self.view?.stopLoadingIndicator()
            return
        }
        handleShowingEmptyListPlaceHolder(with: loadingDataText)
        self.view?.animateLoadingIndicator()
    }
    
    private func handleShowingEmptyListPlaceHolder(with text: String) {
        guard self.movies.isEmpty else { return }
        self.view?.updateCollectionPlaceholderLabel(text: text)
        self.view?.showCollectionPlaceholderLabel()
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
        defer {
            self.view?.hideCollectionPlaceholderLabel()
            self.view?.reloadCollectionView()
        }
        guard isFirstPage else {
            self.movies.append(contentsOf: movies)
            return
        }
        self.movies = movies
    }
    
    func stopRefreshingIndicator() {
        self.view?.stopRefreshingIndicator()
    }
    
    func didFailToFetchMovies(with error: Error) {
        self.view?.presentError(with: error.localizedDescription)
        self.handleShowingEmptyListPlaceHolder(with: errorPlaceHolderText)
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
