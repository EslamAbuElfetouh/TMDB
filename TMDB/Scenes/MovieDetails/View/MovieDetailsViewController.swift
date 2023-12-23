//
//  MovieDetailsViewController.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 23/12/2023.
//

import UIKit
import UIComponents

class MovieDetailsViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet private weak var posterView: PosterView!
    @IBOutlet private weak var movieInfoView: MovieInfoView!
    @IBOutlet private weak var summaryTextView: UITextView!

    // MARK: Properties
    var presenter: MovieDetailsPresenterProtocol?
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension MovieDetailsViewController: MovieDetailsControllerProtocol {
}

