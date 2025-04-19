//
//  FavoriteListViewController.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 25/12/2023.
//

import UIKit
import UIComponents

class FavoriteListViewController: UIViewController {
    // MARK: - Outlets

    @IBOutlet private weak var movieCollectionView: UICollectionView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!

    // MARK: - Properties

    private let horizontalMargin: CGFloat = 8
    var presenter: FavoriteListPresenterProtocol?

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        // config collectionView
        configCollectionView()
    }

    // MARK: - CollectionView Configurations

    private func configCollectionView() {
        // config delegate and dataSource
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        // register Cell
        movieCollectionView.registerNib(MovieCell.self)
        // set collection margins
        movieCollectionView.contentInset = UIEdgeInsets(
            top: 0,
            left: horizontalMargin,
            bottom: 0,
            right: horizontalMargin
        )
    }
}

// MARK: - IBActions

extension FavoriteListViewController {
    @IBAction private func backButtonHandler(_ sender: UIButton) {
        self.presenter?.popViewController()
    }
}

// MARK: - Conforming to UICollectionViewDataSource

extension FavoriteListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.moviesItemsCount ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieCell = collectionView.dequeueCell(for: indexPath)
        let cellItem = self.presenter?.getItem(at: indexPath.row)
        cell.configCell(with: cellItem)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout - Config CollectionViewCell size

extension FavoriteListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let cellSize = presenter?.calculateCellSize(collectionView.bounds.width,
                                                          horizontalMargin: horizontalMargin) else {
            return CGSize.zero
        }
        return cellSize
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
}

// MARK: - Conforming to UICollectionViewDelegate

extension FavoriteListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.navigateToMovieDetails(with: indexPath.item)
    }
}

// MARK: Conforming to FavoriteListControllerProtocol

extension FavoriteListViewController: FavoriteListControllerProtocol {
    func reloadCollectionView() {
        movieCollectionView.reloadData()
    }
    
    func startLoading() {
        activityIndicator.startAnimating()
    }
    
    func stopLoading() {
        activityIndicator.stopAnimating()
    }
}
