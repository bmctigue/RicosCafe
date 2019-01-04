//
//  ProductsPresenter.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/31/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit

extension Products {
    struct Presenter: PresenterProtocol {
        typealias Model = Product
        typealias ViewModel = Products.ViewModel
        var models: [Model]
        var dynamicModels: DynamicValue<[ViewModel]> = DynamicValue([ViewModel]())
        
        init(_ models: [Model] = [Model]()) {
            self.models = models
            dynamicModels.value = viewModels
        }
        
        var viewModels: [ViewModel] {
            var resultModels = [ViewModel]()
            for model in models {
                let displayedModel = ViewModel(name: model.name, text: model.text, price: model.price, size: model.size, temp: model.temp, imageUrl: model.imageUrl, image: model.image)
                resultModels.append(displayedModel)
            }
            return resultModels
        }
    }
}
