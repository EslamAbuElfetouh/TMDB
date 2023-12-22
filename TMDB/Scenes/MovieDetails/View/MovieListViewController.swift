//
//  MovieListViewController.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 22/12/2023.
//

import UIKit

class MovieListViewController: UIViewController {
    // MARK: Outlets
    
    // MARK: Propertiesss
    var presenter: MovieListPresenterProtocol?
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension MovieListViewController: MovieListControllerProtocol {
}
