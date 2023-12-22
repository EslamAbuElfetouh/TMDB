//
//  UICollectionView+Extensions.swift
//  UIComponents
//
//  Created by Eslam Abo El Fetouh on 22/12/2023.
//

import Foundation
import UIKit

public extension UICollectionView {
    /// **Dequeues a reusable cell of the specified type**
    /// - Parameter indexPath: The index path specifying the location of the cell
    /// - Returns:  dequeued cell of the specified type.
    /// ```
    /// let cell: MyCell = myCollectionView.dequeueCell(for: indexPath)
    /// ```
    func dequeueCell<CellType: UICollectionViewCell>(for indexPath: IndexPath) -> CellType {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: CellType.identifier, for: indexPath) as? CellType else {
            fatalError("DequeueReusableCell failed while casting")
        }
        return cell
    }
    /// **Registers Cell**
    /// - Parameter cellType: The type of cell to register.
    /// ```
    /// myCollectionView.registerNib(MyCell.self)
    /// ```
    /// 
    func registerNib<CellType: UICollectionViewCell>(_ cellType: CellType.Type) {
        register(CellType.nib, forCellWithReuseIdentifier: CellType.identifier)
    }
    
    /// **Registers a reusable header or footer view.**
    /// - Parameter viewType: The type of header or footer view to register.
    /// ```
    /// myCollectionView.registerNib(MyHeaderView.self)
    /// ```
    func registerNib<ViewType: UICollectionReusableView>(_ viewType: ViewType.Type) {
        register(ViewType.nib, forSupplementaryViewOfKind: ViewType.identifier, withReuseIdentifier: ViewType.identifier)
    }
}
