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
        
        static let drinksImageName = "drinks"
        static let foodImageName = "food"
        static let dessertImageName = "dessert"
        
        static let drinksTitle = "Drinks"
        static let foodTitle = "Food"
        static let dessertTitle = "Dessert"
        
        static let drinksBuilder = Drinks.Builder(with: drinksImageName, title: drinksTitle)
        
        private var window: UIWindow?
        private (set) var tabBarBuilder: Builder.TabBar!
        private lazy var builders: [TabBuilder] = [Builder.App.drinksBuilder]
        
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
