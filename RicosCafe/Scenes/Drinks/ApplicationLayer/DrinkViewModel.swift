//
//  DrinkViewModel.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/26/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit

extension Drinks {
    struct Request {}
    
    struct Response {
        let drinks: [Drink]
    }
    
    struct ViewModel {
        struct DisplayedDrink {
            let name: String
            let text: String
            let price: Double
            let size: Int
            let temp: Int
            let imageUrl: String
            let image: String
        }
        
        var dynamicDrinks: DynamicValue<[DisplayedDrink]> = DynamicValue([DisplayedDrink]())
        
        private var drinks: [Drink]
        private var displayedDrinks: [DisplayedDrink] {
            var resultDrinks = [DisplayedDrink]()
            for drink in drinks {
                let displayedDrink = Drinks.ViewModel.DisplayedDrink(name: drink.name, text: drink.text, price: drink.price, size: drink.size, temp: 0, imageUrl: drink.imageUrl, image: drink.image)
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
        
        mutating func updateDisplayedDrinks(_ drinks: [Drink]) {
            self.drinks = drinks
            dynamicDrinks.value = displayedDrinks
        }
    }
}
