//
//  UICollectionView+Extensions.swift
//  UIComponents
//
//  Created by Eslam Abo El Fetouh on 22/12/2023.
//

import Foundation
import UIKit

public extension UICollectionView {
    func dequeueCell<CellType: UICollectionViewCell>(for indexPath: IndexPath) -> CellType {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: CellType.identifier, for: indexPath) as? CellType else {
            fatalError("DequeueReusableCell failed while casting")
        }
        return cell
    }
    
    func registerNib<CellType: UICollectionViewCell>(_ cellType: CellType.Type) {
        register(CellType.nib, forCellWithReuseIdentifier: CellType.identifier)
    }
    
    func registerNib<ViewType: UICollectionReusableView>(_ viewType: ViewType.Type) {
        register(ViewType.nib, forSupplementaryViewOfKind: ViewType.identifier, withReuseIdentifier: ViewType.identifier)
    }
}
