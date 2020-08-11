//
//  HomeTableViewCell.swift
//  Moviseries-iOS
//
//  Created by ADMIN on 10/08/2020.
//  Copyright © 2020 ADMIN. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(title: String, posterUrl: String) {
        titleLabel.text = title
        let url = RootPath.imagesURL.rawValue + posterUrl
        guard let imageData = try? Data(contentsOf: URL(string: url)!) else { return }
        if let returnedImage = UIImage(data: imageData) {
            posterImage.image = returnedImage
        }
    }

}
