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
        private let store: StoreProtocol
        private (set) var tabBarBuilder: Builder.TabBar!
        
        init(with window: UIWindow?, store: StoreProtocol) {
            self.window = window
            self.store = store
            self.tabBarBuilder = Builder.TabBar(with: configureBuilders())
        }
        
        func run() {
            tabBarBuilder.run()
            self.window?.rootViewController = tabBarBuilder.getTabBar()
            self.window?.makeKeyAndVisible()
        }
    }
}

extension Builder.App {
    
    private static let drinksImageName = "drinks"
    private static let foodImageName = "food"
    private static let dessertImageName = "dessert"
    
    private static let drinksTitle = "Drinks"
    private static let foodTitle = "Food"
    private static let dessertTitle = "Dessert"
    
    func configureBuilders() -> [TabBuilder] {
        let drinksBuilder = Drinks.Builder(with: Builder.App.drinksImageName, title: Builder.App.drinksTitle, store: store)
        return [drinksBuilder]
    }
}
