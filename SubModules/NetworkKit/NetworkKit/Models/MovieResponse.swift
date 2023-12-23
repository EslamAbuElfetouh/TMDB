//
//  MovieResponse.swift
//  NetworkKit
//
//  Created by Eslam Abo El Fetouh on 23/12/2023.
//

import Foundation

public struct MovieResponse: Codable {
    let page: Int?
    let results: [Movie]?
    let totalPages: Int?
    let totalResults: Int?
    
    public init(page: Int? = nil,
                results: [Movie]? = nil,
                totalPages: Int? = nil,
                totalResults: Int? = nil) {
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
}
