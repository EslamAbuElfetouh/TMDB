//
//  MovieDetailsLoader.swift
//  NetworkKit
//
//  Created by Eslam Abo El Fetouh on 23/12/2023.
//

import Foundation
import NetworkLayer

// Protocol for the MovieDetailsLoaderProtocol
public protocol MovieDetailsLoaderProtocol {
    func loadMovieDetails(with id: Int,
                          completionHandler: @escaping (APIResult<Movie>) -> Void)
}

// MovieLoader class implementing the DiscoverMoviesLoader and LoaderProtocol
public final class MovieDetailsLoader: MovieDetailsLoaderProtocol, APILoaderProtocol {
    public typealias Entity = Movie
    
    public init() { }
    // MARK: Call API Request
    public func loadMovieDetails(with id: Int, completionHandler: @escaping (APIResult<Entity>) -> Void) {
        let configuration = APIRequestConfiguration(router: MoviesDetailsAPIRouter.movie(id: id),
                                                    method: .get())
        loadItems(requestConfiguration: configuration, completionHandler: completionHandler)
        
    }
}
