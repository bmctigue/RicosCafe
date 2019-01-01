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
        typealias Displayed = Drinks.ViewModel.DisplayedModel
        
        var dynamicModels: DynamicValue<[Displayed]> = DynamicValue([Displayed]())
        
        private var models: [Model]
        private var displayedModels: [Displayed] {
            var resultModels = [Displayed]()
            for model in models {
                let displayedModel = Displayed(name: model.name, text: model.text, price: model.price, size: model.size, temp: model.temp, imageUrl: model.imageUrl, image: model.image)
                resultModels.append(displayedModel)
            }
            return resultModels
        }
        
        init(_ models: [Model] = [Model]()) {
            self.models = models
            dynamicModels.value = displayedModels
        }
        
        func getDisplayedModels() -> [Displayed] {
            return displayedModels
        }
        
        func updateDisplayedModels(_ response: Response<Model>) {
            self.models = response.models
            dynamicModels.value = displayedModels
        }
    }
}
