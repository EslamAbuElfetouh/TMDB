//
//  FavoriteListInteractor.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 25/12/2023.
//

import UIKit
import NetworkKit

class FavoriteListInteractor {
    // MARK: - Properties

    var presenter: FavoriteListInteractorOutput?
    private let movieLoader: FavoriteListLoaderProtocol

    // MARK: - Init

    init(loader: FavoriteListLoaderProtocol) {
        self.movieLoader = loader
    }
}

// MARK: - Conforming to FavoriteListPresenterInteractorProtocol

extension FavoriteListInteractor: FavoriteListPresenterInteractorProtocol {
    func fetchMoviesList() {
        presenter?.startLoading()
        movieLoader.loadMovies { [weak self] result in
            DispatchQueue.main.async {
                self?.handleFetchedResult(result)
            }
        }
    }
}

// MARK: - API Handling

extension FavoriteListInteractor {
    private func handleFetchedResult(_ result: Result<MovieResponse, Error>) {
        defer {
            presenter?.stopLoading()
        }
        switch result {
        case .success(let movieResponse):
            let moviesEntities = movieResponse.results?.compactMap { mapToEntity($0) } ?? []
            presenter?.didFetchMovies(moviesEntities)
        case .failure(let error):
            presenter?.showErrorAlert(with: error.localizedDescription)
        }
    }
    
    private func mapToEntity(_ model: Movie) -> FavoriteListEntity {
        FavoriteListEntity(
            id: model.id ?? .zero,
            title: model.title ?? "",
            releaseDate: model.releaseDate ?? "",
            posterPathSuffix: model.posterPath ?? ""
        )
    }
}
