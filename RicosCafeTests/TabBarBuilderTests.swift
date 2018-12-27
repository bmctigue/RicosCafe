//
//  TabBarBuilderTests.swift
//  RicosCafeTests
//
//  Created by Bruce McTigue on 11/28/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import XCTest
@testable import RicosCafe

class TabBarBuilderTests: XCTestCase {
    
    func testBuilderNoViewControllers() {
        let builders: [TabBuilder] =  []
        let tabBarBuilder = Builder.TabBar(with: builders)
        tabBarBuilder.run()
        let tabBarController = tabBarBuilder.getTabBar()
        var controllersCount = 0
        if let controllers = tabBarController.viewControllers {
            controllersCount = controllers.count
            for (index,_) in controllers.enumerated() {
                tabBarController.selectedIndex = index
            }
        }
        let itemsCount = tabBarController.tabBar.items?.count ?? 0
        XCTAssert(controllersCount == builders.count)
        XCTAssert(itemsCount == builders.count)
    }
}
