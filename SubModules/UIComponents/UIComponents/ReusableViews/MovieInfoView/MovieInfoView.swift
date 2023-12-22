//
//  MovieInfoView.swift
//  UIComponents
//
//  Created by Eslam Abo El Fetouh on 22/12/2023.
//

import UIKit

public final class MovieInfoView: UIView {
   // MARK: Outlets
    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var movieTitleLabel: UILabel!
    @IBOutlet private weak var movieSubitleLabel: UILabel!
    @IBOutlet private weak var movieRatingLabel: UILabel!

    // MARK: - Initializers
    public override init(frame: CGRect) {
        super.init(frame: frame)
        instantiateNib()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        instantiateNib()
    }
    // MARK: Configurations
    public func configView(with item: MovieInfoViewItemProtocol) {
        self.movieImageView.loadImage(with: item.imagePath)
        self.movieTitleLabel.text = item.title
        self.movieSubitleLabel.text = item.subTitle
        self.movieRatingLabel.text = item.averageRating
        
    }
}
