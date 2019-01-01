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
    
    var tabBarController: UITabBarController?
    var controllersCount = 0
    
    func testBuilderNoViewControllers() {
        let expectation = self.expectation(description: "run")
        let builders: [TabBuilder] =  []
        let tabBarBuilder = Builder.TabBar(with: builders)
        tabBarBuilder.run() { [weak self] tabBarController in
            self?.tabBarController = tabBarController
            if let controllers = tabBarController.viewControllers {
                self?.controllersCount = controllers.count
                for (index,_) in controllers.enumerated() {
                    tabBarController.selectedIndex = index
                }
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3.0, handler: nil)
        let itemsCount = tabBarController?.tabBar.items?.count ?? 0
        XCTAssert(controllersCount == builders.count)
        XCTAssert(itemsCount == builders.count)
    }
}
