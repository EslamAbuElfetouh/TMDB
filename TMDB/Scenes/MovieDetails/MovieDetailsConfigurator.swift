//
//  MovieDetailsConfigurator.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 23/12/2023.
//

import UIKit
import NetworkKit
import UIComponents

protocol MovieDetailsBuilderInput {
    var id: Int { get }
}

struct MovieDetailsInput: MovieDetailsBuilderInput {
    let id: Int
}

// MARK: - Configuration

final class MovieDetailsConfigurator {
    class func viewController(input: MovieDetailsInput) -> MovieDetailsViewController {
        let view = MovieDetailsViewController()
        let loader: MovieDetailsLoaderProtocol = MovieDetailsLoader()
        let interactor = MovieDetailsInteractor(movieDetailsLoader: loader)
        let router = MovieDetailsRouter(viewController: view)
        let presenter = MovieDetailsPresenter(
            view: view,
            interactor: interactor,
            router: router,
            movieDetailsInput: input
        )
        view.presenter = presenter
        interactor.presenter = presenter
        return view
    }
}

// MARK: - Protocols

// Controller --> Presenter
protocol MovieDetailsPresenterProtocol: AnyObject {
    func viewDidLoad()
    func popViewController()
}

// Presenter --> Controller
protocol MovieDetailsControllerProtocol: LoaderIndicatorProtocol {
    func configBackdropView(with item: PosterViewItemProtocol)
    func configMovieInfoView(with item: MovieInfoViewItemProtocol)
    func presentError(with message: String)
    func configSummary(with text: String)
}

// Presenter --> Interactor
protocol MovieDetailsPresenterInteractorProtocol: AnyObject {
    func fetchMovieDetails(with id: Int)
}

// Interactor --> Presenter
protocol MovieDetailsInteractorOutput: LoaderIndicatorProtocol {
    func didFetchMovieDetails(_ movie: MovieDetailsEntity)
    func didFailToFetchMovieDetails(with error: Error)
}

// Presenter --> Router
protocol MovieDetailsRouterProtocol: AnyObject {
    func popViewController()
}
