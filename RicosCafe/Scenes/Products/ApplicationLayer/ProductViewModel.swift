//
//  ProductViewModel.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/26/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit

extension Products {
    struct ViewModel {
        let name: String
        let text: String
        let price: String
        let imageUrl: String
        let image: String
        
        var formattedPrice: String {
            return "$\(price)"
        }
    }
}
