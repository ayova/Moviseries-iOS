//
//  ListCollectionViewCell.swift
//  Moviseries-iOS
//
//  Created by ADMIN on 28/08/2020.
//  Copyright © 2020 ADMIN. All rights reserved.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var poster: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(image: UIImage) {
        poster.image = image
    }
}
