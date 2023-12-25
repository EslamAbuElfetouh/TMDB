//
//  FavoriteListLoader.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 25/12/2023.
//

import Foundation
import NetworkKit

protocol MovieLoaderOptionProtocol {
    var usesStaticData: Bool { get }
}
protocol FavoriteListLoaderProtocol {
    func loadMovies(completionHandler: @escaping (Result<MovieResponse, Error>) -> Void)
}

final class FavoriteListLoader: FavoriteListLoaderProtocol {
    private let loaderOption: MovieLoaderOptionProtocol
    private let remoteLoader: DiscoverMoviesLoaderProtocol
    private let localDataLoader: MovieLocalDataLoaderProtocol
    
    init(loaderOption: MovieLoaderOptionProtocol,
         remoteLoader: DiscoverMoviesLoaderProtocol,
         localDataLoader: MovieLocalDataLoaderProtocol) {
        self.loaderOption = loaderOption
        self.remoteLoader = remoteLoader
        self.localDataLoader = localDataLoader
    }
    
    func loadMovies(completionHandler: @escaping (Result<MovieResponse, Error>) -> Void) {
        guard loaderOption.usesStaticData else {
            loadUsingRemoteLoader(completionHandler: completionHandler)
            return
        }
        completionHandler(.success(loadUsingLocalLoader()))
    }
    
    private func loadUsingRemoteLoader(completionHandler: @escaping (Result<MovieResponse, Error>) -> Void) {
        remoteLoader.loadMovies(with: .init(page: 1),
                                completionHandler: completionHandler)
    }
    
    private func loadUsingLocalLoader() -> MovieResponse {
        localDataLoader.loadMovies()
    }
}
