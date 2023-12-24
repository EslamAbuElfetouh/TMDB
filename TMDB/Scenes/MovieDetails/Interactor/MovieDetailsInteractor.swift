//
//  MovieDetailsInteractor.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 23/12/2023.
//

import UIKit
import NetworkKit
class MovieDetailsInteractor {
    // MARK: Properites
    var presenter: MovieDetailsInteractorOutput?
    private let movieDetailsLoader: MovieDetailsLoaderProtocol
    // MARK: Init
    init(movieDetailsLoader loader: MovieDetailsLoaderProtocol) {
        self.movieDetailsLoader = loader
    }
}
extension MovieDetailsInteractor: MovieDetailsPresenterInteractorProtocol {
    // MARK: API call - Fetch Movie Details
    func fetchMovieDetails(with id: Int) {
        movieDetailsLoader.loadMovieDetails(with: id) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.handleFetchedResult(result)
            }
        }
    }
    // MARK: - Handle API response
    private func handleFetchedResult(_ result: Result<Movie, Error>) {
        switch result {
        case .success(let movieResponse):
            handleSuccessfulFetch(movieResponse)
            print("Received movie response: \(movieResponse)")
        case .failure(let error):
            handleFailedFetch(error)
        }
    }
    
    private func handleSuccessfulFetch(_ movieResponse: Movie) {

    }

    private func handleFailedFetch(_ error: Error) {

    }
}

