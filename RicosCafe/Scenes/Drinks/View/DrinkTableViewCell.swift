//
//  DrinkTableViewCell.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 1/2/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import UIKit

class DrinkTableViewCell: UITableViewCell {
    typealias ViewModel = Drinks.ViewModel
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    
    var viewModel: ViewModel? {
        didSet {
            if let viewModel = viewModel {
                nameLabel.text = viewModel.name
                descriptionLabel.text = viewModel.text
                priceLabel.text = "$\(viewModel.price)"
                cellImageView.image = viewModel.image.isEmpty ? nil : UIImage(named: viewModel.image)
            }
        }
    }
    
    override func layoutSubviews() {
        cellImageView.layer.cornerRadius = 8
    }
}
