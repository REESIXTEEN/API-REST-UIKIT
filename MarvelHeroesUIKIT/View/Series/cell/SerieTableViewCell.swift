//
//  SerieTableViewCell.swift
//  MarvelHeroesUIKIT
//
//  Created by Pablo Gómez on 4/4/23.
//

import UIKit

class SerieTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var descriptionCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        imageCell.layer.cornerRadius = 8
        
        let layer = CAGradientLayer()
        layer.frame = CGRect(x: 0, y: imageCell.bounds.height/2, width: imageCell.bounds.width, height: imageCell.bounds.height/2)
        layer.colors = [UIColor.clear.cgColor,UIColor.black.cgColor]
        self.imageCell.layer.insertSublayer(layer, at: 0)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
