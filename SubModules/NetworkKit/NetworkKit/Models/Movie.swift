//
//  Movie.swift
//  NetworkKit
//
//  Created by Eslam Abo El Fetouh on 23/12/2023.
//

import Foundation

public struct Movie: Codable {
    public let id: Int?
    public let title: String?
    public let overview: String?
    public let releaseDate: String?
    public let posterPath: String?
    public let backdropPath: String?
    let genreIds: [Int]?
    let popularity: Double?
    public let voteAverage: Double?
    let voteCount: Int?

    // MARK: - init

    public init(
        id: Int? = nil,
        title: String? = nil,
        overview: String? = nil,
        releaseDate: String? = nil,
        posterPath: String? = nil,
        backdropPath: String? = nil,
        genreIds: [Int]? = nil,
        popularity: Double? = nil,
        voteAverage: Double? = nil,
        voteCount: Int? = nil
    ) {
        self.id = id
        self.title = title
        self.overview = overview
        self.releaseDate = releaseDate
        self.posterPath = posterPath
        self.backdropPath = backdropPath
        self.genreIds = genreIds
        self.popularity = popularity
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }

    // MARK: - CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case popularity
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
