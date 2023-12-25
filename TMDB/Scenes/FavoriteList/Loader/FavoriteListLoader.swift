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

final class FavoriteListLoader {
    private let LoaderOption: MovieLoaderOptionProtocol
    private let remoteLoader: DiscoverMoviesLoaderProtocol
    private let localDataLoader: MovieLocalDataLoaderProtocol
    
    init(LoaderOption: MovieLoaderOptionProtocol,
         remoteLoader: DiscoverMoviesLoaderProtocol,
         localDataLoader: MovieLocalDataLoaderProtocol) {
        self.LoaderOption = LoaderOption
        self.remoteLoader = remoteLoader
        self.localDataLoader = localDataLoader
    }
    
    func loadMovies(completionHandler: @escaping (Result<MovieResponse, Error>) -> Void) {
        guard LoaderOption.usesStaticData else {
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
