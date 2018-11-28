//
//  TabBarAssemblerTests.swift
//  RicosCafeTests
//
//  Created by Bruce McTigue on 11/28/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import XCTest
@testable import RicosCafe

class TabBarAssemblerTests: XCTestCase {
    
    func testAssemblerNoViewControllers() {
        let assemblers: [TabAssembler] =  []
        let tabBarAssembler = TabBarAssembler(with: assemblers)
        tabBarAssembler.run()
        let tabBarController = tabBarAssembler.getTabBar()
        var controllersCount = 0
        if let controllers = tabBarController.viewControllers {
            controllersCount = controllers.count
            for (index,_) in controllers.enumerated() {
                tabBarController.selectedIndex = index
            }
        }
        let itemsCount = tabBarController.tabBar.items?.count ?? 0
        XCTAssert(controllersCount == assemblers.count)
        XCTAssert(itemsCount == assemblers.count)
    }
}
