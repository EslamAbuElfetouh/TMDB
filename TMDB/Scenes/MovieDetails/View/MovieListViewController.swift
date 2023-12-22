//
//  MovieListViewController.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 22/12/2023.
//

import UIKit
import UIComponents

final class MovieListViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet private weak var titleSectionStackView: UIStackView!
    @IBOutlet private weak var favButton: UIButton!
    @IBOutlet private weak var summaryView: UIView!
    @IBOutlet private weak var moviesCollectionView: UICollectionView!
    
    // MARK: Propertiesss
    var presenter: MovieListPresenterProtocol?
    private let horizontalMargin: CGFloat = 8
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        configCollectionView()
    }
    // MARK: Configurations
    private func configCollectionView() {
        // config delgate and dataSoruce
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
        // register Cell
        moviesCollectionView.registerNib(MovieCell.self)
        // set collection margins
        moviesCollectionView.contentInset = .init(top: 0, left: horizontalMargin, bottom: 0, right: horizontalMargin)
    }
    
    // MARK: @IBActions
    @IBAction func favButtonHandler(_ sender: UIButton) {
        
    }
}

extension MovieListViewController: MovieListControllerProtocol {
}
extension MovieListViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // TODO: Return value from presenter
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieCell = collectionView.dequeueCell(for: indexPath)
        // TODO: Config Cell
        cell.backgroundColor = .white
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout - Config CollectionViewCell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let cellSize = presenter?.calculateCellSize(collectionView.bounds.width,
                                                 horizontalMargin: self.horizontalMargin) else {
            return CGSize.zero
        }
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        // Set the minimum spacing between items in a row
        return .zero
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.navigateToMovieDetails(with: indexPath.item)
    }
    
}
