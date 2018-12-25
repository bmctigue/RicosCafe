//
//  AppBuilder.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 11/28/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit

final class AppBuilder: BaseBuilder {
    
    private var window: UIWindow?
    private (set) var tabBarBuilder: TabBarBuilder!
    private lazy var builders: [TabBuilder] = []
    
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
