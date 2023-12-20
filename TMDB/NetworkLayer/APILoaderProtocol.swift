//
//  APILoaderProtocol.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 20/12/2023.
//

import Foundation

typealias ResultHandler<Entity: Codable> = ((APIResult<Entity>) -> Void)

/// A protocol to load data from the API,  and promote code reusability and testability.
protocol APILoaderProtocol {
    associatedtype Entity: Codable
}

extension APILoaderProtocol {
    /**
     Loads items based on the provided API request configuration.
     - Parameters:
        - configuration: The API request configuration.
        - completionHandler: A closure to handle the Codable result of the API request.
     */
    func loadItems(requestConfiguration configuration: APIRequestConfiguration,
                   completionHandler: @escaping ResultHandler<Entity>) {
        APIClient.shared.performRequest(with: configuration) { (result: APIResult<Entity>) in
            switch result {
            case .success(let data):
                completionHandler(.success(data))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
