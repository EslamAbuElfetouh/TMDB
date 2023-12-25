//
//  CellSizeCalculator.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 25/12/2023.
//

import Foundation
import UIKit

final class CellSizeCalculator {
    static func calculateCellSize(collectionViewWidth: CGFloat,
                                  horizontalMargin: CGFloat,
                                  itemsPerRow: CGFloat,
                                  cellHeightToWidthRatio: CGFloat) -> CGSize {
        let spacingBetweenCells: CGFloat = horizontalMargin * 2
        let leftAndRightMargins = horizontalMargin * 2
        
        let totalMargins = leftAndRightMargins + spacingBetweenCells
        
        let availableWidth = collectionViewWidth - totalMargins
        let cellWidth = availableWidth / itemsPerRow
        return CGSize(width: cellWidth, height: cellWidth * cellHeightToWidthRatio)
    }
}
