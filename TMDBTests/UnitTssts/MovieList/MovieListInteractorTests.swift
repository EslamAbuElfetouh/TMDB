//
//  MovieListInteractorTests.swift
//  TMDBTests
//
//  Created by Eslam Abo El Fetouh on 20/12/2023.
//

import XCTest
import NetworkKit
@testable import TMDB

final class MovieListInteractorTests: XCTestCase {
    
    // MARK: Factory Methods
    /// Creates the system under test (SUT) for MovieListInteractor.
    /// - Returns: MovieListInteractor instance with mock dependencies for testing.
    private func createSystemUnderTest(loader: DiscoverMoviesLoaderProtocol,
                                       presenter: MovieListInteractorOutput?) -> MovieListInteractor {
        let interactor = MovieListInteractor(loader: loader)
        interactor.presenter = presenter
        return interactor
    }
    
    private func discoveryMoviesLoaderMockFactory() -> MockDiscoverMoviesLoader {
        MockDiscoverMoviesLoader()
    }
    
    private func discoveryMoviesPresenterMockFactory() -> MockMovieListPresenter {
        MockMovieListPresenter()
    }
    // TODO: Testcases
    func test_FetchMoviesList_Success() {
        // Given
        let loaderMock = discoveryMoviesLoaderMockFactory()
        let presenterMock = discoveryMoviesPresenterMockFactory()
        let interactor = createSystemUnderTest(loader: loaderMock,
                                               presenter: presenterMock)
        let successMovieResponse = TestDataBuilder.createMovieResponse()

        let expectation = XCTestExpectation(description: "Fetching Data completed")
        // When
        //         Set up expected result for the loader
        loaderMock.expectedResult = .success(successMovieResponse)
        // Perform fetchMoviesList
        interactor.fetchMoviesList()
        // Wait for expectation
        presenterMock.didFinish = {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 4.0)
        // Then
        XCTAssertEqual(loaderMock.loadMoviesCallsCount, 1, "Expected loadMovies to be called once")
        XCTAssertEqual(presenterMock.didFetchMoviesCallsCount, 1, "Expected didFetchMovies to be called once")
        XCTAssertEqual(presenterMock.fetchedMovies.count, 1, "Expected one movie to be fetched")
        XCTAssertEqual(presenterMock.loadingIndicatorVisibleCallsCount, 2, "Expected setLoadingIndicatorVisible to be called twice")
        XCTAssertFalse(presenterMock.loadingIndicatorIsVisibile ?? false, "Loading indicator should be visible")
        XCTAssertEqual(presenterMock.stopRefreshingIndicatorCallsCount, 0, "stopRefreshingIndicator should not be called")
    }
    
    func test_FetchMoviesList_Failure() {
        // Given
        let loaderMock = discoveryMoviesLoaderMockFactory()
        let presenterMock = discoveryMoviesPresenterMockFactory()
        let interactor = createSystemUnderTest(loader: loaderMock, presenter: presenterMock)
        let error = APIError.serverError
        
        let expectation = XCTestExpectation(description: "Fetching Data completed")
        // When
        loaderMock.expectedResult = .failure(error)
        interactor.fetchMoviesList()
        // Wait for expectation
        presenterMock.didFinish = {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 4.0)
        // Then
        XCTAssertEqual(loaderMock.loadMoviesCallsCount, 1,
                       "Expected loadMovies to be called once")
        XCTAssertEqual(presenterMock.didFailToFetchMoviesCallsCount, 1,
                       "Expected didFailToFetchMovies to be called once")
        XCTAssertEqual(presenterMock.errorMessage?.localizedDescription,
                       error.localizedDescription,
                       "Expected correct error to be passed to the presenter")
        XCTAssertEqual(presenterMock.loadingIndicatorVisibleCallsCount, 2,
                       "Expected setLoadingIndicatorVisible to be called twice")
        XCTAssertFalse(presenterMock.loadingIndicatorIsVisibile ?? false,
                       "Loading indicator should be hidden")
        XCTAssertEqual(presenterMock.stopRefreshingIndicatorCallsCount, 0,
                       "stopRefreshingIndicator should not be called")
    }
    
    func test_refreshMoviesMoviesList_Success() {
        // Given
        let loaderMock = discoveryMoviesLoaderMockFactory()
        let presenterMock = discoveryMoviesPresenterMockFactory()
        let interactor = createSystemUnderTest(loader: loaderMock, presenter: presenterMock)
        let successMovieResponse = TestDataBuilder.createMovieResponse()

        let expectation = XCTestExpectation(description: "Fetching Data completed")
        // When
        //         Set up expected result for the loader
        loaderMock.expectedResult = .success(successMovieResponse)
        // Perform fetchMoviesList
        interactor.refreshMovies()
        // Wait for expectation
        presenterMock.didFinish = {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 4.0)
        // Then
        XCTAssertEqual(loaderMock.loadMoviesCallsCount, 1,
                       "Expected loadMovies to be called once for refresh")
        XCTAssertEqual(presenterMock.didFetchMoviesCallsCount, 1,
                       "Expected didFetchMovies to be called once for refresh")
        XCTAssertEqual(presenterMock.fetchedMovies.count, 1,
                       "Expected one movie to be fetched on refresh")
        XCTAssertEqual(presenterMock.loadingIndicatorVisibleCallsCount, .zero,
                       "Expected setLoadingIndicatorVisible to be not being called since Refresh Indiactor is the on running")
        XCTAssertEqual(presenterMock.stopRefreshingIndicatorCallsCount, 1,
                       "stopRefreshingIndicator should be called once")
    }
    
}
