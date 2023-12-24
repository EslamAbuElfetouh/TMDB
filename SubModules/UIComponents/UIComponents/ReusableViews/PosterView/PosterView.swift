//
//  PosterView.swift
//  UIComponents
//
//  Created by Eslam Abo El Fetouh on 22/12/2023.
//

import UIKit

public protocol PosterViewItemProtocol {
    var backdropPath: String { get }
}

public class PosterView: UIView {
    // MARK: Outlets
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var overlayView: UIView!
    // MARK: Properites
    private var gradientLayer: CAGradientLayer?
    // Content mode property
    var posterContentMode: UIView.ContentMode {
        get { posterImageView.contentMode }
        set { posterImageView.contentMode = newValue }
    }
    // Dimming level property
    var dimmingLevel: CGFloat {
        get { overlayView.alpha }
        set { overlayView.alpha = min(0.85, max(0.0, newValue)) }
    }
    
    // Overlay color property
    var overlayColor: UIColor {
        get { overlayView.backgroundColor ?? .black }
        set { overlayView.backgroundColor = newValue }
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
    // MARK: Layout Subviews
    public override func layoutSubviews() {
        super.layoutSubviews()
        // Update the gradient layer's frame to match the bounds of the view
        gradientLayer?.frame = bounds
    }
    
    // MARK: Configurations
    public func configView(with item: PosterViewItemProtocol) {
        self.posterImageView.loadImage(with: item.backdropPath)
    }
    
    // MARK: Gradient Overlay
    public func applyGradientOverlay(
        colors: [UIColor] = [.lightGray, .black],
        locations: [NSNumber]? = nil,
        startPoint: CGPoint = CGPoint(x: 0.5, y: 0),
        endPoint: CGPoint = CGPoint(x: 0.5, y: 1)
    ) {
        self.gradientLayer = self.overlayView.addGradientOverlay(colors: colors,
                                                                 locations: locations,
                                                                 startPoint: startPoint,
                                                                 endPoint: endPoint)
    }
}
