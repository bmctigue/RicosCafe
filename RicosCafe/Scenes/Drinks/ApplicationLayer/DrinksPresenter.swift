//
//  DrinksPresenter.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/31/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit

extension Drinks {
    struct Presenter {
        
        var dynamicModels: DynamicValue<[Drinks.ViewModel.DisplayedModel]> = DynamicValue([Drinks.ViewModel.DisplayedModel]())
        
        private var models: [Drink]
        private var displayedModels: [Drinks.ViewModel.DisplayedModel] {
            var resultModels = [Drinks.ViewModel.DisplayedModel]()
            for model in models {
                let displayedModel = Drinks.ViewModel.DisplayedModel(name: model.name, text: model.text, price: model.price, size: model.size, temp: model.temp, imageUrl: model.imageUrl, image: model.image)
                resultModels.append(displayedModel)
            }
            return resultModels
        }
        
        init(_ models: [Drink] = [Drink]()) {
            self.models = models
            dynamicModels.value = displayedModels
        }
        
        func getDisplayedModels() -> [Drinks.ViewModel.DisplayedModel] {
            return displayedModels
        }
        
        mutating func updateDisplayedModels(_ response: Response<Drink>) {
            self.models = response.models
            dynamicModels.value = displayedModels
        }
    }
}
