//
//  DiscoverAPIRouter.swift
//  NetworkKit
//
//  Created by Eslam Abo El Fetouh on 23/12/2023.
//

import Foundation
import NetworkLayer

enum DiscoverAPIRouter: APIRouterProtocol {
    case movie
    
    var path: String {
        return "discover/movie"
    }
}
