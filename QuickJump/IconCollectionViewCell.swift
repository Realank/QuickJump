//
//  IconCollectionViewCell.swift
//  QuickJump
//
//  Created by Realank on 16/1/22.
//  Copyright © 2016年 Realank-Mac. All rights reserved.
//

import UIKit

class IconCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var name = "" {
        didSet{
            nameLabel.text = name
        }
    }
    var scheme = "" {
        didSet {
            imageView.image = UIImage(named: "\(scheme).png")
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
