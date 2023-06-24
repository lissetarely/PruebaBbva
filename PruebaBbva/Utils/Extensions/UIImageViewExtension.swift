//
//  UIImageViewExtension.swift
//  PruebaBbva
//
//  Created by Liset Areli Sanchez Martinez on 23/06/23.
//

import UIKit
import Alamofire

extension UIImageView {
    
    public func downloadImage(imageURL: String) {

        AF.request(imageURL, method: .get)
            .validate()
            .responseData(completionHandler: { (responseData) in
                self.image = UIImage(data: responseData.data!)
                DispatchQueue.main.async {
                    // Refresh you views
                }
            })
    }
}
