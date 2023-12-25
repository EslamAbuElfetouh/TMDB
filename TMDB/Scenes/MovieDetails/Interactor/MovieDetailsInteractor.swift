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
        self.presenter?.startLoading()
        movieDetailsLoader.loadMovieDetails(with: id) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.handleFetchedResult(result)
                self.presenter?.stopLoading()
            }
        }
    }
    // MARK: - Handle API response
    private func handleFetchedResult(_ result: Result<Movie, Error>) {
        switch result {
        case .success(let movieResponse):
            handleSuccessfulFetch(movieResponse)
        case .failure(let error):
            handleFailedFetch(error)
        }
    }
    
    private func handleSuccessfulFetch(_ movieResponse: Movie) {
        let movieEntity = mapToEntity(movieResponse)
        self.presenter?.didFetchMovieDetails(movieEntity)
    }
    
    private func handleFailedFetch(_ error: Error) {
        
    }
    
    // Helpers
    private func mapToEntity(_ movie: Movie) -> MovieDetailsEntity {
        .init(id: movie.id ?? .zero,
              title: movie.title ?? "",
              releaseDate: movie.releaseDate ?? "",
              overview: movie.overview ?? "",
              posterPathSuffix: movie.posterPath ?? "",
              backdropPathSuffix: movie.backdropPath ?? "",
              ratings: movie.voteAverage ?? .zero)
    }
    
}
