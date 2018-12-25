//
//  AppBuilder.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 11/28/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit

final class AppBuilder: BaseBuilder {
    
    static let drinks = "drinks"
    static let food = "food"
    static let dessert = "dessert"
    
    private var window: UIWindow?
    private (set) var tabBarBuilder: TabBarBuilder!
    private lazy var builders: [TabBuilder] = [DrinksBuilder(with: AppBuilder.drinks)]
    
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
