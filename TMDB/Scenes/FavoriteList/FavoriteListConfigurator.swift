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
protocol LoaderIndicatorProtocol: AnyObject {
    func startLoading()
    func stopLoading()
}
// Controller --> Presenter
protocol FavoriteListPresenterProtocol: MovieListPresentable {
    func viewDidLoad()
    func popViewController()
}

// Presenter --> Controller
protocol FavoriteListControllerProtocol: LoaderIndicatorProtocol, AlertPopupProtocol {
    func reloadCollectionView()
}

// Presenter --> Interactor
protocol FavoriteListPresenterInteractorProtocol: AnyObject {
    func fetchMoviesList()
}

// Interactor --> Presenter
protocol FavoriteListInteractorOutput: LoaderIndicatorProtocol {
    func didFetchMovies(_ movies: [FavoriteListEntity])
    func showErrorAlert(with message: String)
}
// Presenter --> Router
protocol FavoriteListRouterProtocol: AnyObject {
    func popViewController()
    func navigateToMovieDetails(for movie: MovieDetailsBuilderInput)
}
