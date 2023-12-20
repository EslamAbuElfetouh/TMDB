//
//  APIRequestParameters.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 20/12/2023.
//

import Foundation

// Encapsulate API request parameters
struct APIRequestParameters {
    let router: APIRouterProtocol
    let apiVersion: APIClient.APIVersion
    let method: APIClient.RequestMethod
}

