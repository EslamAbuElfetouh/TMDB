//
//  UIImageView+Extensions.swift
//  UIComponents
//
//  Created by Eslam Abo El Fetouh on 22/12/2023.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func loadImage(with path: String) {
        self.kf.setImage(with: URL(string: path))
    }
}

