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
    
    // task: make it to stop flickering the images while deque reuseable cells
    // solution: keep track of image url string by using string variable on the cell
    
    private var urlString = ""
    
    func configureCell(urlString: String) {
        self.urlString = urlString
        
        planetImage.getImage(urlString: urlString) { (result) in
            switch result {
            case .failure:
                DispatchQueue.main.async {
                    self.planetImage.image = UIImage(systemName: "person.fill")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    // if the cells urlString is the same as one being passed in from the cellforRow
                    if self.urlString == urlString {
                        self.planetImage.image = image
                    }
                }
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // empty out image view (nil)
        planetImage.image = nil 
    }
}
