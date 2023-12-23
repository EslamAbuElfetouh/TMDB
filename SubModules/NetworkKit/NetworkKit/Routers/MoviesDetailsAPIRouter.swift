//
//  MoviesDetailsAPIRouter.swift
//  NetworkKit
//
//  Created by Eslam Abo El Fetouh on 23/12/2023.
//

import Foundation
import NetworkLayer

enum MoviesDetailsAPIRouter: APIRouterProtocol {
    case movie(id: Int)
    
    var path: String {
        switch self {
        case .movie(let id):
            return "movie/\(id)"
        }
    }
}
