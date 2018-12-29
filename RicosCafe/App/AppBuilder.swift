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
        
        private static let assetName = "drinksJson"
        
        private static let drinksImageName = "drinks"
        private static let foodImageName = "food"
        private static let dessertImageName = "dessert"
        
        private static let drinksTitle = "Drinks"
        private static let foodTitle = "Food"
        private static let dessertTitle = "Dessert"
        
        private let store = LocalStore(assetName)
        private let drinksBuilder: TabBuilder
        
        private var window: UIWindow?
        private (set) var tabBarBuilder: Builder.TabBar!
        private var builders: [TabBuilder]
        
        init(with window: UIWindow?) {
            self.window = window
            self.drinksBuilder = Drinks.Builder(with: Builder.App.drinksImageName, title: Builder.App.drinksTitle, store: store)
            self.builders = [drinksBuilder]
            self.tabBarBuilder = Builder.TabBar(with: builders)
        }
        
        func run() {
            tabBarBuilder.run()
            self.window?.rootViewController = tabBarBuilder.getTabBar()
            self.window?.makeKeyAndVisible()
        }
    }
}
