//
//  AppBuilderTests.swift
//  RicosCafeTests
//
//  Created by Bruce McTigue on 11/28/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import XCTest
@testable import RicosCafe

class AppBuilderTests: XCTestCase {
    
    func testAppBuilder() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let builder = AppBuilder(with: window)
        builder.run()
        let tabBarBuilder = builder.getTabBarBuilder()
        let tabBar = tabBarBuilder.getTabBar()
        let builders = tabBarBuilder.getBuilders()
        let controllersCount = tabBar.viewControllers?.count ?? 0
        XCTAssert(controllersCount == builders.count)
    }
}

extension AppBuilder {
    func getTabBarBuilder() -> TabBarBuilder {
        return tabBarBuilder
    }
}
