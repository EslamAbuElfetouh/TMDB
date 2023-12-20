//
//  APIClient.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 20/12/2023.
//

import Foundation
import Alamofire

typealias APIResult<Entity: Codable> = Result<Entity, Error>

// Protocol defining the API client's behavior
protocol APIClientProtocol {
    func performRequest<Entity: Codable>(router: APIRouterProtocol,
                                         apiVersion: APIClient.APIVersion,
                                         method: APIClient.RequestMethod,
                                         completion: @escaping (APIResult<Entity>) -> Void)
}
// Singleton class implementing the API client
final class APIClient: APIClientProtocol {
    static let shared = APIClient()
    private static let baseURL = "https://api.themoviedb.org/"

    private init() {}
    
    func performRequest<Entity: Codable>(router: APIRouterProtocol,
                                         apiVersion: APIVersion,
                                         method: RequestMethod,
                                         completion: @escaping (APIResult<Entity>) -> Void) {
        let url = apiVersion.baseUrl + router.path

        let requestMethod: HTTPMethod
        var requestParameters: [String: Any]?
        switch method {
        case .post(let parameters):
            requestMethod = .post
            requestParameters = parameters
        case .get:
            requestMethod = .get
        }
        
        AF.request(url,
                   method: requestMethod,
                   parameters: requestParameters)
        .validate(statusCode: 200..<300)
        .responseDecodable(of: Entity.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

// Enums related to the API client
extension APIClient {
    enum APIVersion: String {
        case v3 = "3/"
        
        var baseUrl: String {
            return APIClient.baseURL + rawValue
        }
    }
    // MARK: HTTP request methods
    enum RequestMethod {
        case get
        case post(parameters: [String: Any])
    }
}
