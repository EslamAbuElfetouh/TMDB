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
        // Adjust these values based on your layout requirements
        let itemsPerRow: CGFloat = 2
        let spacingBetweenCells: CGFloat = horizontalMargin * 2
        let leftAndRightMargins = horizontalMargin * 2
        
        let totalMargins = leftAndRightMargins + spacingBetweenCells
        
        let availableWidth = collectionViewWidth - totalMargins
        let cellWidth = availableWidth / itemsPerRow
        return CGSize(width: cellWidth, height: cellWidth * movieCellHeightToWidthRatio)
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
