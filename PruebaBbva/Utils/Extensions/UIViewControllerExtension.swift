//
//  UIViewControllerExtension.swift
//  PruebaBbva
//
//  Created by Liset Areli Sanchez Martinez on 23/06/23.
//

import UIKit

extension UIViewController {
    
    func showAlert(message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Atención",
                message: message,
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
}
