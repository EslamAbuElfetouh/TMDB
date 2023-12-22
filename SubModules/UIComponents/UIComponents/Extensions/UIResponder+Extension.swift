//
//  UIResponder+Extension.swift
//  UIComponents
//
//  Created by Eslam Abo El Fetouh on 22/12/2023.
//

import Foundation
import UIKit

public protocol Identifiable {
    static var identifier: String { get }
}

extension UIResponder: Identifiable {
    public static var identifier: String { String(describing: self) }
}
