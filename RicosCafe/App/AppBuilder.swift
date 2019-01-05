//
//  AppBuilder.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 11/28/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit

enum Builder {
    final class App: BaseBuilder {
        
        private var window: UIWindow?
        private (set) var tabBarBuilder: Builder.TabBar!
        private var colorTheme: ColorTheme
        private var colorManager: ColorManager
        
        init(with window: UIWindow?) {
            self.window = window
            self.colorTheme = BlueColorTheme()
            self.colorManager = ColorManager(colorTheme)
            self.tabBarBuilder = Builder.TabBar(with: configureBuilders())
        }
        
        func run() {
            tabBarBuilder.run { [weak self] tabBarController in
                self?.window?.rootViewController = tabBarController
                self?.window?.makeKeyAndVisible()
            }
        }
    }
}

extension Builder.App {
    
    static let productsAssetName = "productsJson"
    
    private static let drinksImageName = "drinks"
    private static let foodImageName = "food"
    private static let dessertImageName = "dessert"
    
    private static let drinksTitle = "Drinks"
    private static let foodTitle = "Food"
    private static let dessertTitle = "Dessert"
    
    func configureBuilders() -> [TabBuilder] {
        let store = LocalStore(Builder.App.productsAssetName)
        let drinksBuilder = Products.Builder(with: Builder.App.drinksImageName, title: Builder.App.drinksTitle, store: store, state: .drink)
        let foodBuilder = Products.Builder(with: Builder.App.foodImageName, title: Builder.App.foodTitle, store: store, state: .entree)
        let dessertBuilder = Products.Builder(with: Builder.App.dessertImageName, title: Builder.App.dessertTitle, store: store, state: .dessert)
        return [drinksBuilder, foodBuilder, dessertBuilder]
    }
}
