//
//  MovieCell.swift
//  UIComponents
//
//  Created by Eslam Abo El Fetouh on 22/12/2023.
//

import UIKit

public final class MovieCell: UICollectionViewCell {
    // MARK: - Outlets

    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!

    // MARK: - Configurations

    public func configCell(with item: MovieCellItemProtocol?) {
        guard let item else {
            return
        }
        movieImageView.loadImage(with: item.posterPath)
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
    }
}
