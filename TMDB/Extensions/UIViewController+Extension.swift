//
//  UIViewController+Extension.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 24/12/2023.
//

import Foundation

import UIKit

extension UIViewController {
    func showAlert(title: String = "Error",
                           message: String,
                           preferredStyle: UIAlertController.Style = .alert,
                           alertActionTitle: String = "OK") {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: preferredStyle)
        let okAction = UIAlertAction(title: alertActionTitle, style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
