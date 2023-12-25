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
    @IBOutlet private weak var backdropView: BackdropView!
    @IBOutlet private weak var movieInfoView: MovieInfoView!
    @IBOutlet private weak var summaryTextView: UITextView!

    // MARK: Properties
    var presenter: MovieDetailsPresenterProtocol?
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        // configs
        configPosterView()
        configTextViewAppearance()
    }
        // MARK: - Configurations
    private func configPosterView() {
        self.backdropView.applyGradientOverlay()
    }
    
    private func configTextViewAppearance() {
        summaryTextView.configureText(lineSpacing: 12,
                                      textColor: .white,
                                      withTextStyle: .body)
    }
    // MARK: @IBActions
    @IBAction func backButtonHandler(_ sender: UIButton) {
        self.presenter?.popViewController()
    }
}

extension MovieDetailsViewController: MovieDetailsControllerProtocol {
    
    func configBackdropView(with item: PosterViewItemProtocol) {
        backdropView.configView(with: item)
    }
    
    func configMovieInfoView(with item: MovieInfoViewItemProtocol) {
        movieInfoView.configView(with: item)
    }
    
    func configSummary(with text: String) {
        summaryTextView.text = text
    }
    func presentError(with message: String) {
        self.showAlert(message: message) {
            self.presenter?.popViewController()
        }
    }
}
