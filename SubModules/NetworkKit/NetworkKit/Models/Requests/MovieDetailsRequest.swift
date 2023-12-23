//
//  MovieDetailsRequest.swift
//  NetworkKit
//
//  Created by Eslam Abo El Fetouh on 23/12/2023.
//

import Foundation

public struct MovieDetailsRequest: Encodable {
    let movieId: Int

    public init(movieId: Int) {
        self.movieId = movieId
    }
    
    // CodingKeys for customization
    enum CodingKeys: String, CodingKey {
        case movieId = "movie_id"
    }
}
