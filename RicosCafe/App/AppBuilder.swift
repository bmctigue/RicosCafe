//
//  AppBuilder.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 11/28/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit

final class AppBuilder: BaseBuilder {
    
    static let drinksImageName = "drinks"
    static let foodImageName = "food"
    static let dessertImageName = "dessert"
    
    static let drinksTitle = "Drinks"
    static let foodTitle = "Food"
    static let dessertTitle = "Dessert"
    
    static let drinksBuilder = DrinksBuilder(with: AppBuilder.drinksImageName, title: AppBuilder.drinksTitle)
    
    private var window: UIWindow?
    private (set) var tabBarBuilder: TabBarBuilder!
    private lazy var builders: [TabBuilder] = [AppBuilder.drinksBuilder]
    
    init(with window: UIWindow?) {
        self.window = window
        self.tabBarBuilder = TabBarBuilder(with: builders)
    }
    
    func run() {
        tabBarBuilder.run()
        self.window?.rootViewController = tabBarBuilder.getTabBar()
        self.window?.makeKeyAndVisible()
    }
}
