//
//  PlanetCell.swift
//  AstronomyPhotos
//
//  Created by Tsering Lama on 12/9/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import UIKit

class PlanetCell: UITableViewCell {
    
    @IBOutlet weak var planetImage: UIImageView!
    
    func configureCell(urlString: String) {
        planetImage.setImage(urlString: urlString) { (result) in
            switch result {
            case .failure:
                DispatchQueue.main.async {
                    self.planetImage.image = UIImage(systemName: "person.fill")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self.planetImage.image = image
                }
            }
        }
    }
}
