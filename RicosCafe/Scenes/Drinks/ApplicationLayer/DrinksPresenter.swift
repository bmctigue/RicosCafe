//
//  DrinksPresenter.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/31/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit

extension Drinks {
    class Presenter {
        
        typealias Model = Drink
        typealias ViewModel = Drinks.ViewModel
        
        var dynamicModels: DynamicValue<[ViewModel]> = DynamicValue([ViewModel]())
        
        private var models: [Model]
        private var displayedModels: [ViewModel] {
            var resultModels = [ViewModel]()
            for model in models {
                let displayedModel = ViewModel(name: model.name, text: model.text, price: model.price, size: model.size, temp: model.temp, imageUrl: model.imageUrl, image: model.image)
                resultModels.append(displayedModel)
            }
            return resultModels
        }
        
        init(_ models: [Model] = [Model]()) {
            self.models = models
            dynamicModels.value = displayedModels
        }
        
        func getDisplayedModels() -> [ViewModel] {
            return displayedModels
        }
        
        func updateDisplayedModels(_ response: Response<Model>) {
            self.models = response.models
            dynamicModels.value = displayedModels
        }
    }
}
