//
//  MovieListConfigurator.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 22/12/2023.
//

import UIKit

final class MovieListConfigurator {
    
    // MARK: Configuration
    class func viewController() -> MovieListViewController {
        let view = MovieListViewController()
        let interactor = MovieListInteractor()
        let router = MovieListRouter(viewController: view)
        let presenter = MovieListPresenter(view: view,
                                           interactor: interactor,
                                           router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        return view
    }
}
// MARK: - Protocols
// Controller --> Presenter
protocol MovieListPresenterProtocol: AnyObject {
    func viewDidLoad()
    func calculateCellSize(_ collectionViewWidth: CGFloat,
                            horizontalMargin: CGFloat) -> CGSize
    func navigateToMovieDetails(with index: Int)
}

// Presenter --> Controller
protocol MovieListControllerProtocol: AnyObject {
}

// Presenter --> Interactor
protocol MovieListPresenterInteractorProtocol: AnyObject {
}

// Interactor --> Presenter
protocol MovieListInteractorOutput: AnyObject {
}
// Presenter --> Router
protocol MovieListRouterProtocol: AnyObject {
    func navigateToMovieDetails()
}
