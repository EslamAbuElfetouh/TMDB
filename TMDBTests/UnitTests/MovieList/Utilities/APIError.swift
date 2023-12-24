//
//  APIError.swift
//  TMDBTests
//
//  Created by Eslam Abo El Fetouh on 24/12/2023.
//

import Foundation

enum APIError: Error, Equatable {
    case badRequest
    case unauthorized
    case serverError
    case didnotSetExpectedResult
}
