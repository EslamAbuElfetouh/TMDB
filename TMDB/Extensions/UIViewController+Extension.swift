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
    
    func showBottomSheetAlert(title: String = "Error",
                              message: String,
                              actions: [UIAlertAction]) {
        let bottomSheetController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        for action in actions {
            bottomSheetController.addAction(action)
        }
        
        present(bottomSheetController, animated: true, completion: nil)
    }
}
