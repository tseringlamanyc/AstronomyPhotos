//
//  UIimageView+Extension.swift
//  AstronomyPhotos
//
//  Created by Tsering Lama on 12/9/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import UIKit

extension UIImageView {
    
    // instance method
    func setImage(urlString: String, completionHandler: @escaping (Result<UIImage?, AppError>) -> ()) {
        // UIActivityIndicatorView
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .black
        activityIndicator.center = center // center of UIImageView
        addSubview(activityIndicator) // adds the activtyindicator to the view
        activityIndicator.startAnimating()
        
        NetworkHelper.shared.performDataTask(userurl: urlString) { [weak activityIndicator] (result) in
            
            DispatchQueue.main.async {
                activityIndicator?.stopAnimating()
            }
            
            
            switch result {
            case .failure(let appError):
                completionHandler(.failure(.networkClinetError(appError)))
            case .success(let data):
                if let image = UIImage(data: data) {
                    completionHandler(.success(image))
                }
            }
        }
    }
}
