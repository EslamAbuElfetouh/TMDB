//
//  MovieListPresenterTests.swift
//  TMDBTests
//
//  Created by Eslam Abo El Fetouh on 22/12/2023.
//

import XCTest
@testable import TMDB

final class MovieListPresenterTests: XCTestCase {

    // MARK: Factory Methods
    /// Creates the system under test (SUT) for MovieListPresenter.
    /// - Returns: MovieListPresenter instance with mock dependencies for testing.
    func createSystemUnderTest(view: MovieListControllerProtocol,
                                   interactor: MovieListPresenterInteractorProtocol,
                                   router: MovieListRouterProtocol) -> MovieListPresenter {
        MovieListPresenter(view: view, interactor: interactor, router: router)
    }

    func mockMovieListViewFactory() -> MockMovieListView {
        MockMovieListView()
    }

    func mockMovieListInteractorFactory() -> MockMovieListInteractor {
        MockMovieListInteractor()
    }

    func mockMovieListRouterFactory() -> MockMovieListRouter {
        MockMovieListRouter()
    }
    
    // MARK: - Test Cases
    
    func test_ViewDidLoad_CallsInteractorFetchMoviesList() {
        // Given
        let view = mockMovieListViewFactory()
        let interactor = mockMovieListInteractorFactory()
        let router = mockMovieListRouterFactory()
        let presenter = createSystemUnderTest(view: view,
                                        interactor: interactor,
                                        router: router)
        // When
        presenter.viewDidLoad()
        
        // Then
        XCTAssertEqual(interactor.fetchMoviesCallsCount, 1, "Expected interactor's fetchMoviesList to be called once")
    }
    
    func test_DidFetchMovies_UpdatesMoviesAndReloadsCollectionView() {
        // Given
        let view = mockMovieListViewFactory()
        let interactor = mockMovieListInteractorFactory()
        let router = mockMovieListRouterFactory()
        let presenter = createSystemUnderTest(view: view,
                                              interactor: interactor,
                                              router: router)
        let sampleMovies = TestDataBuilder.createMoviesListEntities()
        
        // When
        presenter.didFetchMovies(sampleMovies, isFirstPage: true)
        
        // Then
        XCTAssertEqual(view.reloadCollectionViewCallsCount, 1, "Expected reloadCollectionView to be called once")
        XCTAssertEqual(presenter.moviesItemsCount, 3, "Expected presenter to have correct number of movies")
    }

    func test_DidFailToFetchMovies_PresentsErrorToView() {
        // Given
        let view = mockMovieListViewFactory()
        let interactor = mockMovieListInteractorFactory()
        let router = mockMovieListRouterFactory()
        let presenter = createSystemUnderTest(view: view,
                                              interactor: interactor,
                                              router: router)
        let sampleError = APIError.badRequest
        
        // When
        presenter.didFailToFetchMovies(with: sampleError)
        
        // Then
        XCTAssertEqual(view.presentErrorCallsCount, 1, "Expected presentError to be called once")
        XCTAssertEqual(view.errorMessage, sampleError.localizedDescription, "Expected correct error message to be presented")
    }

    func test_StopRefreshingIndicator_CallsViewStopRefreshingIndicator() {
        // Given
        let view = mockMovieListViewFactory()
        let interactor = mockMovieListInteractorFactory()
        let router = mockMovieListRouterFactory()
        let presenter = createSystemUnderTest(view: view,
                                              interactor: interactor,
                                              router: router)
        
        // When
        presenter.stopRefreshingIndicator()
        
        // Then
        XCTAssertEqual(view.stopRefreshingIndicatorCallsCount, 1, "Expected stopRefreshingIndicator to be called once")
    }

    func test_UserReachedEndOfScreen_CallsInteractorFetchMoviesList() {
        // Given
        let view = mockMovieListViewFactory()
        let interactor = mockMovieListInteractorFactory()
        let router = mockMovieListRouterFactory()
        let presenter = createSystemUnderTest(view: view,
                                              interactor: interactor,
                                              router: router)
        
        // When
        presenter.userReachedEndOfScreen()
        
        // Then
        XCTAssertEqual(interactor.fetchMoviesCallsCount, 1, "Expected interactor's fetchMoviesList to be called once")
    }

    func test_RefreshMovies_CallsInteractorRefreshMovies() {
        // Given
        let view = mockMovieListViewFactory()
        let interactor = mockMovieListInteractorFactory()
        let router = mockMovieListRouterFactory()
        let presenter = createSystemUnderTest(view: view,
                                              interactor: interactor,
                                              router: router)
        
        // When
        presenter.refreshMovies()
        
        // Then
        XCTAssertEqual(interactor.refreshMoviesCallCount, 1, "Expected interactor's refreshMovies to be called once")
    }

}
