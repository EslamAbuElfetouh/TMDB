//
//  MovieListConfigurator.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 22/12/2023.
//

import UIKit
import NetworkKit

final class MovieListConfigurator {
    
    // MARK: Configuration
    class func viewController() -> MovieListViewController {
        let view = MovieListViewController()
        let loader = DiscoverMoviesLoader()
        let interactor = MovieListInteractor(loader: loader)
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
protocol MovieListPresentable: AnyObject {
    func calculateCellSize(_ collectionViewWidth: CGFloat,
                           horizontalMargin: CGFloat) -> CGSize
    var moviesItemsCount: Int { get }
    func getItem(at index: Int) -> MovieListEntity?
    func navigateToMovieDetails(with index: Int)
}
protocol MovieListPresenterProtocol: MovieListPresentable {
    func viewDidLoad()
    func userReachedEndOfScreen()
    func refreshMovies()
    func didTapFavButton()
}

// Presenter --> Controller
protocol MovieListControllerProtocol: AnyObject {
    func reloadCollectionView()
    func presentError(with message: String)
    func animateLoadingIndicator()
    func stopLoadingIndicator()
    func stopRefreshingIndicator()
    func showActionSheetAlert(with configuration: AlertConfiguration)
    func showCollectionPlaceholderLabel()
    func hideCollectionPlaceholderLabel()
    func updateCollectionPlaceholderLabel(text: String)
}

// Presenter --> Interactor
protocol MovieListPresenterInteractorProtocol: AnyObject {
    func fetchMoviesList()
    func refreshMovies()
}

// Interactor --> Presenter
protocol MovieListInteractorOutput: AnyObject {
    func didFetchMovies(_ movies: [MovieListEntity], isFirstPage: Bool)
    func didFailToFetchMovies(with error: Error)
    func setLoadingIndicatorVisible(_ isVisible: Bool)
    func stopRefreshingIndicator()
}
// Presenter --> Router
protocol MovieListRouterProtocol: AnyObject {
    func navigateToMovieDetails(for movie: MovieDetailsBuilderInput)
    func navigateToFavoriteScreen(withStaticData isStatic: Bool)
}
