//
//  DiscoverMoviesLoader.swift
//  NetworkKit
//
//  Created by Eslam Abo El Fetouh on 23/12/2023.
//

import Foundation
import NetworkLayer

// Protocol for the DiscoverMoviesLoaderProtocol
public protocol DiscoverMoviesLoaderProtocol {
    func loadMovies(with parameters: DiscoverMovieRequest,
                    completionHandler: @escaping (APIResult<MovieResponse>) -> Void)
}

// MovieLoader class implementing the DiscoverMoviesLoader and LoaderProtocol
public final class DiscoverMoviesLoader: DiscoverMoviesLoaderProtocol, APILoaderProtocol {
    public typealias Entity = MovieResponse
    
    public init() { }
    // MARK: Call API Request
    public func loadMovies(with parameters: DiscoverMovieRequest,
                           completionHandler: @escaping (APIResult<Entity>) -> Void) {
        let configuration = APIRequestConfiguration(router: DiscoverAPIRouter.movie,
                                                    method: .get(parameters: parameters))
        loadItems(requestConfiguration: configuration, completionHandler: completionHandler)
    }
}
