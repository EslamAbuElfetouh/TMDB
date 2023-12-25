//
//  FavoriteListConfigurator.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 25/12/2023.
//

import UIKit
import NetworkKit

struct FavoriteListInput: MovieLoaderOptionProtocol {
    let usesStaticData: Bool
}

final class FavoriteListConfigurator {
    
    // MARK: Configuration
    class func viewController(input: FavoriteListInput) -> FavoriteListViewController {
        let view = FavoriteListViewController()
        let loader = createLoader(with: input)
        let interactor = FavoriteListInteractor(loader: loader)
        let router = FavoriteListRouter(viewController: view)
        let presenter = FavoriteListPresenter(view: view,
                                              interactor: interactor,
                                              router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        return view
    }
    
    private static func createLoader(with inputData: MovieLoaderOptionProtocol) -> FavoriteListLoaderProtocol {
        let remoteLoader = DiscoverMoviesLoader()
        let localLoader = MovieStaticDataLoader()
        return FavoriteListLoader(loaderOption: inputData,
                                  remoteLoader: remoteLoader,
                                  localDataLoader: localLoader)
    }
}
// MARK: - Protocols
// Controller --> Presenter
protocol FavoriteListPresenterProtocol: MovieListPresentable {
    func viewDidLoad()
    func popViewController()
}

// Presenter --> Controller
protocol FavoriteListControllerProtocol: AnyObject {
}

// Presenter --> Interactor
protocol FavoriteListPresenterInteractorProtocol: AnyObject {
}

// Interactor --> Presenter
protocol FavoriteListInteractorOutput: AnyObject {
}
// Presenter --> Router
protocol FavoriteListRouterProtocol: AnyObject {
    func popViewController()
    func navigateToMovieDetails(for movie: MovieDetailsBuilderInput)
}
