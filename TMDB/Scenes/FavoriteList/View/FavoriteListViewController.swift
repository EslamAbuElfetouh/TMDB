//
//  FavoriteListViewController.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 25/12/2023.
//

import UIKit

class FavoriteListViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet private weak var movieCollectioView: UILabel!
    // MARK: Properties
    var presenter: FavoriteListPresenterProtocol?
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    // MARK: @IBActions
    @IBAction func backButtonHandler(_ sender: UIButton) {
        self.presenter?.popViewController()
    }
}

extension FavoriteListViewController: FavoriteListControllerProtocol {
}
