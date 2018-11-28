//
//  AppAssembler.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 11/28/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit

final class AppAssembler: BaseAssembler {
    
    private var window: UIWindow?
    private (set) var tabBarAssembler: TabBarAssembler!
    private lazy var assemblers: [TabAssembler] = []
    
    init(with window: UIWindow?) {
        self.window = window
        self.tabBarAssembler = TabBarAssembler(with: assemblers)
    }
    
    func run() {
        tabBarAssembler.run()
        self.window?.rootViewController = tabBarAssembler.getTabBar()
        self.window?.makeKeyAndVisible()
    }
}
