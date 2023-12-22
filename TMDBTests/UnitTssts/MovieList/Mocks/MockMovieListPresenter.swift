//
//  MockMovieListPresenter.swift
//  TMDBTests
//
//  Created by Eslam Abo El Fetouh on 22/12/2023.
//

import Foundation
@testable import TMDB

class MockMovieListPresenter: MovieListPresenterProtocol {
    // MARK: Properties
    var viewDidLoadCallsCount = 0

    func viewDidLoad() {
        self.viewDidLoadCallsCount += 1
    }
}
