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
        
        private static let drinksImageName = "drinks"
        private static let foodImageName = "food"
        private static let dessertImageName = "dessert"
        
        private static let drinksTitle = "Drinks"
        private static let foodTitle = "Food"
        private static let dessertTitle = "Dessert"
        
        private static let drinksBuilder = Drinks.Builder(with: drinksImageName, title: drinksTitle)
        
        private var window: UIWindow?
        private (set) var tabBarBuilder: Builder.TabBar!
        private var builders: [TabBuilder] = [Builder.App.drinksBuilder]
        
        init(with window: UIWindow?) {
            self.window = window
            self.tabBarBuilder = Builder.TabBar(with: builders)
        }
        
        func run() {
            tabBarBuilder.run()
            self.window?.rootViewController = tabBarBuilder.getTabBar()
            self.window?.makeKeyAndVisible()
        }
    }
}
