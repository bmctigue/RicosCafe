//
//  ProductTableViewCell.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 1/2/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    typealias ViewModel = Products.ViewModel
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    
    override func layoutSubviews() {
        cellImageView.layer.cornerRadius = 8
    }
}
