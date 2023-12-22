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
    func movieListPresenterFactory(view: MovieListControllerProtocol,
                                   interactor: MovieListPresenterInteractorProtocol,
                                   router: MovieListRouterProtocol) -> MovieListPresenter {
        MovieListPresenter(view: view, interactor: interactor, router: router)
    }

    func mockMovieListViewFactory() -> MovieListControllerProtocol {
        MockMovieListView()
    }

    func mockMovieListInteractorFactory() -> MovieListPresenterInteractorProtocol {
        MockMovieListInteractor()
    }

    func mockMovieListRouterFactory() -> MovieListRouterProtocol {
        MockMovieListRouter()
    }
    
    /// Creates the system under test (SUT) for MovieListPresenter.
    /// - Returns: MovieListPresenter instance with mock dependencies for testing.
    func createSystemUnderTest() -> MovieListPresenter {
        movieListPresenterFactory(view: mockMovieListViewFactory(),
                                  interactor: mockMovieListInteractorFactory(),
                                  router: mockMovieListRouterFactory())
    }
    
    // TODO: Testcases
    
}
