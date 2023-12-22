//
//  MovieCell.swift
//  UIComponents
//
//  Created by Eslam Abo El Fetouh on 22/12/2023.
//

import UIKit

public final class MovieCell: UICollectionViewCell {
    
    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    
    public func configCell(with item: MovieCellItemProtocol) {
        movieImageView.loadImage(with: item.imagePath)
        titleLabel.text = item.title
        subtitleLabel.text = item.subTitle
    }
}
