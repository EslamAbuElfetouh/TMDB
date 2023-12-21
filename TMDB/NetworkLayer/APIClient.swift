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
    func performRequest<Entity: Codable>(with configuration: APIRequestConfiguration,
                                         completion: @escaping (APIResult<Entity>) -> Void)
}
// Singleton class implementing the API client
final public class APIClient: APIClientProtocol {
    // Singleton instance
    static let shared = APIClient()
    private static let baseURL = "https://api.themoviedb.org/"
    private var appConfig: AppConfigProtocol?
    // Private initializer to enforce singleton pattern
    private init() { }
    
    // MARK: Configure AppConfig
    public func config(appConfig: AppConfigProtocol) {
        self.appConfig = appConfig
    }
}
// Build and Perform request
extension APIClient {
    func performRequest<Entity: Codable>(with configuration: APIRequestConfiguration,
                                         completion: @escaping (APIResult<Entity>) -> Void) {
        let url = buildURL(with: configuration)
        
        let requestMethod = determineRequestMethod(from: configuration.method)
        let requestHeader = buildRequestHeader(with: configuration.header)
        let requestParameters = buildRequestParameters(from: configuration.method)
        
        makeRequest( with: .init(url: url,
                                 method: requestMethod,
                                 headers: requestHeader,
                                 parameters: requestParameters),
                     completion: completion)
    }
    
    private func buildURL(with configuration: APIRequestConfiguration) -> String {
        return configuration.apiVersion.baseUrl + configuration.router.path
    }
    
    private func determineRequestMethod(from method: APIClient.RequestMethod) -> HTTPMethod {
        switch method {
        case .post:
            return .post
        case .get:
            return .get
        }
    }
    
    private func buildRequestHeader(with header: HTTPHeaders) -> HTTPHeaders {
        var header: HTTPHeaders = header
        header["Authorization"] = appConfig?.getToken()
        return header
    }
    
    private func buildRequestParameters(from method: APIClient.RequestMethod) -> [String: Any]? {
        switch method {
        case .post(let parameters):
            return try? JSONSerialization.jsonObject(with: JSONEncoder().encode(parameters)) as? [String: Any]
        case .get(let parameters):
            guard let parameters = parameters else { return nil }
            return try? JSONSerialization.jsonObject(with: JSONEncoder().encode(parameters)) as? [String: Any]
        }
    }
    
    private func makeRequest<Entity: Codable>(with builder: RequestBuilder,
                                              completion: @escaping (APIResult<Entity>) -> Void) {
        
        AF.request(builder.url, method: builder.method, parameters: builder.parameters,  headers: builder.headers)
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
public extension APIClient {
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
        case get(parameters: Encodable? = nil)
        case post(parameters: Encodable)
    }
}
// Models related to API client
private extension APIClient {
    struct RequestBuilder {
        let url: String
        let method: HTTPMethod
        var headers: HTTPHeaders
        let parameters: [String: Any]?
    }
}
