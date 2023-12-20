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
    func performRequest<Entity: Codable>(with parameters: APIRequestParameters,
                                         completion: @escaping (APIResult<Entity>) -> Void)
}
// Singleton class implementing the API client
final class APIClient: APIClientProtocol {
    static let shared = APIClient()
    private static let baseURL = "https://api.themoviedb.org/"

    private init() {}
    
    func performRequest<Entity: Codable>(with parameters: APIRequestParameters,
                                         completion: @escaping (APIResult<Entity>) -> Void) {
        let url = buildURL(with: parameters)

        let requestMethod = determineRequestMethod(from: parameters.method)
        let requestParameters = buildRequestParameters(from: parameters.method)

        makeRequest(url: url, method: requestMethod, parameters: requestParameters, completion: completion)
    }

    private func buildURL(with parameters: APIRequestParameters) -> String {
        return parameters.apiVersion.baseUrl + parameters.router.path
    }

    private func determineRequestMethod(from method: APIClient.RequestMethod) -> HTTPMethod {
        switch method {
        case .post:
            return .post
        case .get:
            return .get
        }
    }

    private func buildRequestParameters(from method: APIClient.RequestMethod) -> [String: Any]? {
        switch method {
        case .post(let parameters):
            return parameters
        case .get:
            return nil
        }
    }

    private func makeRequest<Entity: Codable>(url: String,
                                              method: HTTPMethod,
                                              parameters: [String: Any]?,
                                              completion: @escaping (APIResult<Entity>) -> Void) {
        AF.request(url, method: method, parameters: parameters)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: Entity.self) { response in
                DispatchQueue.main.async {
                    switch response.result {
                    case .success(let data):
                        completion(.success(data))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            }
    }

}

// Enums related to the API client
extension APIClient {
    // MARK: API versions
    /**
     This enum makes it easier in the future to include new API versions, and even specefiy a new baseUrl to any API version.
     */
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
