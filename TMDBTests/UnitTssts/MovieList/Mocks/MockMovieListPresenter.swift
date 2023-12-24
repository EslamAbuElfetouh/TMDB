//
//  MockMovieListPresenter.swift
//  TMDBTests
//
//  Created by Eslam Abo El Fetouh on 22/12/2023.
//

import Foundation
@testable import TMDB

/// A mock presenter suitable for both the view (controller) and the interactor.
typealias MockMovieListPresenterProtocol = MovieListInteractorOutput & MovieListPresenterProtocol

final class MockMovieListPresenter {
    // MARK: Properties
    // MovieListPresenterProtocol (View) Properties
    var viewDidLoadCallsCount = 0
    var navigateToMovieDetailsCallCount = 0
    var moviesItemsCount: Int {
        fetchedMovies.count
    }
    var selectedMovie: MovieListEntity?
    var userReachedEndOfScreenCallsCount = 0
    var expectedCellSize = CGSize(width: 100, height: 100)
    // MovieListPresenterProtocol (Interactor) Properties
    var errorMessage: Error?
    var didFailToFetchMoviesCallsCount = 0
    var fetchedMovies = [MovieListEntity]()
    var didFetchMoviesCallsCount = 0
    var loadingIndicatorIsVisibile: Bool?
    var loadingIndicatorVisibleCallsCount = 0
    var pullToRefreshCallCount = 0
    var stopRefreshingIndicatorCallsCount = 0
}
// MARK: - MovieListPresenterProtocol (Interactor)
extension MockMovieListPresenter: MovieListInteractorOutput {
    // MARK: Interactor Output methods

    // Handles the case when movies are successfully fetched
    func didFetchMovies(_ movies: [TMDB.MovieListEntity], isFirstPage: Bool) {
        fetchedMovies = movies
        didFetchMoviesCallsCount += 1
    }

    // Handles the case when there is a failure in fetching movies
    func didFailToFetchMovies(with error: Error) {
        errorMessage = error
        didFailToFetchMoviesCallsCount += 1
    }

    // Handles the visibility of the loading indicator
    func setLoadingIndicatorVisible(_ isVisible: Bool) {
        loadingIndicatorVisibleCallsCount += 1
        loadingIndicatorIsVisibile = isVisible
    }

    // Handles stopping the refreshing indicator
    func stopRefreshingIndicator() {
        stopRefreshingIndicatorCallsCount += 1
    }
}

// MARK: - MovieListPresenterProtocol (View)
extension MockMovieListPresenter: MovieListPresenterProtocol {
    // MARK: View methods

    // Verifies that the `viewDidLoad` method is called
    func viewDidLoad() {
        self.viewDidLoadCallsCount += 1
    }

    // Simulates providing an expected cell size for testing purposes
    func calculateCellSize(_ collectionViewWidth: CGFloat, horizontalMargin: CGFloat) -> CGSize {
        expectedCellSize
    }

    // Verifies that the `navigateToMovieDetails` method is called with the expected index
    func navigateToMovieDetails(with index: Int) {
        navigateToMovieDetailsCallCount += 1
    }

    // Simulates providing a movie entity at the specified index for testing purposes
    func getItem(at index: Int) -> TMDB.MovieListEntity? {
        let selectedItem = fetchedMovies[safe: index]
        self.selectedMovie = selectedItem
        return selectedItem
    }

    // Verifies that the `userReachedEndOfScreen` method is called
    func userReachedEndOfScreen() {
        userReachedEndOfScreenCallsCount += 1
    }

    // Verifies that the `refreshMovies` method is called
    func refreshMovies() {
        pullToRefreshCallCount += 1
    }
}
