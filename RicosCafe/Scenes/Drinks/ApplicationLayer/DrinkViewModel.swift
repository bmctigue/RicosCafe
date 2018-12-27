//
//  DrinkViewModel.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/26/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import Foundation
import UIKit

enum Drinks {
    struct Request {}
    
    struct Response {
        let drinks: [Drink]
    }
    
    struct ViewModel {
        struct DisplayedDrink {
            let name: String
            let text: String
            let price: Double
            let imageUrl: String?
            let image: UIImage?
        }
        
        var dynamicDrinks: DynamicValue<[DisplayedDrink]> = DynamicValue([DisplayedDrink]())
        
        private var drinks: [Drink]
        private var displayedDrinks: [DisplayedDrink] {
            var resultDrinks = [DisplayedDrink]()
            for drink in drinks {
                let displayedDrink = Drinks.ViewModel.DisplayedDrink(name: drink.name, text: drink.text, price: drink.price, imageUrl: drink.imageUrl, image: drink.image)
                resultDrinks.append(displayedDrink)
            }
            return resultDrinks
        }
        
        init(_ drinks: [Drink] = [Drink]()) {
            self.drinks = drinks
            dynamicDrinks.value = displayedDrinks
        }
        
        func getDisplayedDrinks() -> [DisplayedDrink] {
            return displayedDrinks
        }
    }
}

extension Drinks.ViewModel {
    mutating func updateDisplayedDrinks(_ drinks: [Drink]) {
        self.drinks = drinks
        dynamicDrinks.value = displayedDrinks
    }
}
