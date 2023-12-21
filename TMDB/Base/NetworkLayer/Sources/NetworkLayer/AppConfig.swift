//
//  AppConfig.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 21/12/2023.
//

import Foundation
import Alamofire

public protocol AppConfigProtocol {
    func configure(token: String)
    func getToken() -> String?
}

final public class AppConfig: AppConfigProtocol {
    // Singleton instance
    public static let shared = AppConfig()
    private var token = String()
    // Private initializer to enforce singleton pattern
    private init() {}
    
    // MARK: Configuration
    public func configure(token: String) {
        self.token = token
    }
    
    public func getToken() -> String? {
        return "Bearer " + token
    }
}
