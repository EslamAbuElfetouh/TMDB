//
//  UITextView+Extension.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 24/12/2023.
//

import Foundation
import UIKit

extension UITextView {
    func configureText(lineSpacing: CGFloat,
                       textColor: UIColor,
                       withTextStyle style: UIFont.TextStyle = .body) {
        guard let text = self.text else { return }

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing

        let font = UIFont.preferredFont(forTextStyle: style)
        
        let attributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle,
            .foregroundColor: textColor,
            .font: font
        ]

        let attributedString = NSMutableAttributedString(string: text, attributes: attributes)
        self.attributedText = attributedString
    }
}
