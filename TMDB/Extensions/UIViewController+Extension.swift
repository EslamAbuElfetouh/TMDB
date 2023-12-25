//
//  UIViewController+Extension.swift
//  TMDB
//
//  Created by Eslam Abo El Fetouh on 24/12/2023.
//

import Foundation
import UIKit

struct AlertConfiguration {
    let title: String
    let message: String
    let actions: [UIAlertAction]
}

protocol AlertPopupProtocol {
    func showAlert(title: String,
                   message: String,
                   preferredStyle: UIAlertController.Style,
                   alertActionTitle: String,
                   completionHandler: (() -> Void)?)
}
extension UIViewController: AlertPopupProtocol {
    func showAlert(title: String = "Error",
                   message: String,
                   preferredStyle: UIAlertController.Style = .alert,
                   alertActionTitle: String = "OK",
                   completionHandler: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: preferredStyle)
        
        let okAction = UIAlertAction(title: alertActionTitle, style: .default) { _ in
            completionHandler?()
        }
        
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension UIViewController {
    func showActionSheetAlert(with configuration: AlertConfiguration,
                              sourceView: UIView?) {
        let alertController = UIAlertController(title: configuration.title,
                                                message: configuration.message,
                                                preferredStyle: .actionSheet)
        
        for action in configuration.actions {
            alertController.addAction(action)
        }
        if let popoverController = alertController.popoverPresentationController {
            popoverController.sourceView = sourceView
        }
        present(alertController, animated: true, completion: nil)
    }
}
