//
//  ProductCollectionViewCell.swift
//  Turkcell Challenge
//
//  Created by Efe Helvacı on 24.12.2017.
//  Copyright © 2017 Efe Helvaci. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceTagLabel: UILabel!
    
    var product: Product! {
        didSet {
            productNameLabel.text = product.name
            productPriceTagLabel.text = "$ \(product.price ?? 0)"
            
            if let imageURL = product.image {
                productImageView.kf.setImage(with: URL(string: imageURL))
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        productImageView.kf.indicatorType = .activity
    }

}
