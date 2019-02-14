//
//  ProductsPresenter.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/31/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit
import Tiguer

extension Products {
    final class Presenter<Model, ViewModel>: Tiguer.Presenter<Model, ViewModel> {

        typealias ProductViewModel = Products.ViewModel
        
        override var baseViewModels: [ViewModel] {
            var resultModels = [ViewModel]()
            let productModels = models as! [Product]
            for model in productModels {
                let displayedModel = ProductViewModel(productId: model.productId, name: model.name, text: model.text, price: model.price, imageUrl: model.imageUrl, image: model.image)
                resultModels.append(displayedModel as! ViewModel)
            }
            return resultModels
        }
    }
}
