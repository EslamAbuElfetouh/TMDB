//
//  MovieDetailsConfigurator.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 23/12/2023.
//

import UIKit

struct MovieDetailsInput {
    
}

final class MovieDetailsConfigurator {
    
    // MARK: Configuration
    class func viewController(input: MovieDetailsInput) -> MovieDetailsViewController {
        let view = MovieDetailsViewController()
        let interactor = MovieDetailsInteractor()
        let router = MovieDetailsRouter(viewController: view)
        let presenter = MovieDetailsPresenter(view: view,
                                              interactor: interactor,
                                              router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        return view
    }
}
// MARK: - Protocols
// Controller --> Presenter
protocol MovieDetailsPresenterProtocol: AnyObject {
    func viewDidLoad()
}

// Presenter --> Controller
protocol MovieDetailsControllerProtocol: AnyObject {
}

// Presenter --> Interactor
protocol MovieDetailsPresenterInteractorProtocol: AnyObject {
}

// Interactor --> Presenter
protocol MovieDetailsInteractorOutput: AnyObject {
}
// Presenter --> Router
protocol MovieDetailsRouterProtocol: AnyObject {
    func popViewController()
}
