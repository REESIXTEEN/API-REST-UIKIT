//
//  CharacterTableViewCell.swift
//  MarvelHeroesUIKIT
//
//  Created by Pablo Gómez on 4/4/23.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var heart: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageCell.layer.cornerRadius = 8
        
        let layer = CAGradientLayer()
        layer.frame = imageCell.bounds
        layer.colors = [UIColor.clear,UIColor.black]
        layer.locations = [0.0, 1.0]
        self.imageCell.layer.insertSublayer(layer, at: 0)
        
//        name.textColor = UIColor.blue
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
