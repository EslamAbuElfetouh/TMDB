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
    @IBOutlet private weak var movieSubtitleLabel: UILabel!
    @IBOutlet private weak var movieRatingLabel: UILabel!

    // MARK: Additional Configurable Properties
    public var titleFont: UIFont? {
        didSet {
            movieTitleLabel.font = titleFont
        }
    }

    public var subtitleFont: UIFont? {
        didSet {
            movieSubtitleLabel.font = subtitleFont
        }
    }

    public var ratingFont: UIFont? {
        didSet {
            movieRatingLabel.font = ratingFont
        }
    }

    public var titleColor: UIColor? {
        didSet {
            movieTitleLabel.textColor = titleColor
        }
    }

    public var subtitleColor: UIColor? {
        didSet {
            movieSubtitleLabel.textColor = subtitleColor
        }
    }

    public var ratingColor: UIColor? {
        didSet {
            movieRatingLabel.textColor = ratingColor
        }
    }

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
        self.movieImageView.loadImage(with: item.posterPath)
        self.movieTitleLabel.text = item.title
        self.movieSubtitleLabel.text = item.subtitle
        self.movieRatingLabel.text = item.averageRating
        
    }
}
