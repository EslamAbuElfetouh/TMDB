//
//  DiscoverMovieRequest.swift
//  NetworkKit
//
//  Created by Eslam Abo El Fetouh on 23/12/2023.
//

import Foundation

public struct DiscoverMovieRequest: Encodable {
    let page: Int
    let sortBy: SortBy?
    let certification: Certification?
    let includeAdult: Bool?
    let includeVideo: Bool?
    let year: Int?
    
    public init(page: Int,
                sortBy: DiscoverMovieRequest.SortBy? = nil,
                certification: DiscoverMovieRequest.Certification? = nil,
                includeAdult: Bool? = false,
                includeVideo: Bool? = nil,
                year: Int? = nil) {
        self.page = page
        self.sortBy = sortBy
        self.certification = certification
        self.includeAdult = includeAdult
        self.includeVideo = includeVideo
        self.year = year
    }
    
    // CodingKeys for customization
    enum CodingKeys: String, CodingKey {
        case sortBy = "sort_by"
        case certification
        case includeAdult = "include_adult"
        case includeVideo = "include_video"
        case page
        case year
    }
}
// Enums for known constant values
public extension DiscoverMovieRequest {
    enum SortBy: String, Encodable {
        case popularity = "popularity.desc"
        case releaseDate = "release_date.desc"
        case revenue = "revenue.desc"
        case primaryReleaseDate = "primary_release_date.desc"
        case originalTitle = "original_title.desc"
        case voteAverage = "vote_average.desc"
        case voteCount = "vote_count.desc"
    }
    
    enum Certification: String, Encodable {
        case g = "G"
        case pg = "PG"
        case pg13 = "PG-13"
        case r = "R"
    }
}
