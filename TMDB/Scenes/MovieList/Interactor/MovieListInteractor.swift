//
//  MovieListInteractor.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 22/12/2023.
//

import UIKit
import NetworkKit

final class MovieListInteractor {
    
    var presenter: MovieListInteractorOutput?
    private let moviesLoader: DiscoverMoviesLoaderProtocol
    private var currentPage: Int = 1
    private var totalPages: Int = .max 
    private var isFetching: Bool = false
    
    // Computed properties
    public var canLoadMore: Bool {
        currentPage <= totalPages
    }
    
    // MARK: Init
    init(loader: DiscoverMoviesLoaderProtocol) {
        self.moviesLoader = loader
    }
}
extension MovieListInteractor: MovieListPresenterInteractorProtocol {
    // MARK: - Get Movies List
    func fetchMoviesList() {
        guard !isFetching,
              canLoadMore else { return }
        isFetching = true
        moviesLoader.loadMovies(with: .init(page: currentPage)) { [weak self] result in
            guard let self else { return }
            defer {
                self.isFetching = false
            }
            switch result {
            case .success(let movieResponse):
                // Set CurrentPage
                self.currentPage = (movieResponse.page ?? self.currentPage) + 1
                // Map response Data
                let moviesEntities = movieResponse.results?.compactMap {
                    self.mapToEntity($0)
                }
                // Update Presenter with Data
                self.presenter?.didFetchMovies(moviesEntities ?? [])
            case .failure(let error):
                self.presenter?.didFailToFetchMovies(with: error)
            }
        }
    }
    
    private func mapToEntity(_ model: Movie) -> MovieListEntity {
        .init(title: model.title ?? "",
              releaseDate: model.releaseDate ?? "",
              posterPath: model.posterPath ?? "")
    }
}

