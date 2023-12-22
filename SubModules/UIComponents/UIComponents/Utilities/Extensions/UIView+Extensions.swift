//
//  UIView+Extensions.swift
//  UIComponents
//
//  Created by Eslam Abo El Fetouh on 22/12/2023.
//

import Foundation
import UIKit

extension UIView {
    /// get nib from bundle
    static var nib: UINib {
        let nibName = identifier
        return UINib(nibName: nibName, bundle: Bundle(for: self))
    }
}
