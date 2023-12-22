//
//  MovieListViewController.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 22/12/2023.
//

import UIKit

final class MovieListViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet private weak var titleSectionStackView: UIStackView!
    @IBOutlet private weak var favButton: UIButton!
    @IBOutlet private weak var summaryView: UIView!
    
    // MARK: Propertiesss
    var presenter: MovieListPresenterProtocol?
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    // MARK: @IBActions
    @IBAction func favButtonHandler(_ sender: UIButton) {
        
    }
}

extension MovieListViewController: MovieListControllerProtocol {
}
