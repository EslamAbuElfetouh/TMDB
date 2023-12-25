//
//  FavoriteListViewController.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 25/12/2023.
//

import UIKit
import UIComponents

class FavoriteListViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet private weak var movieCollectioView: UICollectionView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    // MARK: Properties
    var presenter: FavoriteListPresenterProtocol?
    private let horizontalMargin: CGFloat = 8
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        // config collectionView
        configCollectionView()
    }
    
    // MARK: Configurations
    private func configCollectionView() {
        // config delgate and dataSoruce
        movieCollectioView.delegate = self
        movieCollectioView.dataSource = self
        // register Cell
        movieCollectioView.registerNib(MovieCell.self)
        // set collection margins
        movieCollectioView.contentInset = .init(top: 0,
                                                  left: horizontalMargin,
                                                  bottom: 0,
                                                  right: horizontalMargin)
    }
    // MARK: @IBActions
    @IBAction func backButtonHandler(_ sender: UIButton) {
        self.presenter?.popViewController()
    }
}

extension FavoriteListViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.moviesItemsCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieCell = collectionView.dequeueCell(for: indexPath)
        let cellItem = self.presenter?.getItem(at: indexPath.row)
        cell.configCell(with: cellItem)
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout - Config CollectionViewCell size
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
    
    // MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.navigateToMovieDetails(with: indexPath.item)
    }
}

extension FavoriteListViewController: FavoriteListControllerProtocol {
    func reloadCollectionView() {
        movieCollectioView.reloadData()
    }
    
    func startLoading() {
        activityIndicator.startAnimating()
    }
    
    func stopLoading() {
        activityIndicator.stopAnimating()
    }
}
