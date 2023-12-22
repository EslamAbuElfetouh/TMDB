//
//  UIView+Extensions.swift
//  UIComponents
//
//  Created by Eslam Abo El Fetouh on 22/12/2023.
//

import Foundation
import UIKit

extension UIView {
    /// **Load nib from bundle**
    /// ```
    /// let nib: UINib = UIView.nib
    /// ```
    static var loadNib: UINib {
        UINib(nibName: identifier, bundle: Bundle(for: self))
    }
    
    /// **Check if the nib file exists in the bundle**
    /// - Parameter nibName: The name of the nib file
    /// - Returns: A boolean indicating whether the nib file exists
    /// ```
    /// let exists: Bool = UIView.nibFileExists("MyView")
    /// ```
    private static func nibFileExists(_ nibName: String) -> Bool {
        Bundle(for: self).path(forResource: nibName, ofType: "nib") != nil
    }
    
    /// **Instantiate a view from a nib file**
    /// - Parameter name: The name of the nib file (optional, defaults to the class name)
    /// - Returns: An optional instance of the specified view type
    /// ```
    /// let myView: MyView? = myView.fromNib()
    /// ```
    @discardableResult
    func instantiateNib<Content: UIView>(named name: String? = nil) -> Content? {
        let bundle = Bundle(for: type(of: self))
        let unwrappedName = name ?? String(describing: type(of: self))
        guard Self.nibFileExists(unwrappedName),
              let content = bundle.loadNibNamed(unwrappedName, owner: self, options: nil)?.first as? Content else {
            return nil
        }
        return addView(content)
    }
    
    /// **Add a subview with layout constraints**
    /// - Parameter contentView: The view to add as a subview
    /// - Returns: The added content view
    /// ```
    /// let addedView: MyView = myView.addView(mySubview)
    /// ```
    private func addView<Content: UIView>(_ contentView: Content) -> Content {
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.attachTo(parentView: self)
        return contentView
    }
    
    /// **Attach the view to a parent view with layout constraints**
    /// - Parameters:
    ///   - parentView: The parent view to attach to
    ///   - height: The optional height constraint
    ///   - inset: The inset value for layout constraints
    func attachTo(parentView: UIView, height: CGFloat? = nil, inset: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        parentView.topAnchor.constraint(equalTo: topAnchor, constant: inset).isActive = true
        parentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset).isActive = true
        parentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset).isActive = true
        parentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset).isActive = true
        
        guard let height = height else { return }
        let heightConstraint = heightAnchor.constraint(greaterThanOrEqualToConstant: height)
        heightConstraint.priority = UILayoutPriority(rawValue: 900)
        heightConstraint.isActive = true
    }
}
