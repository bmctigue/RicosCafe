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
        let store = LocalStore(AppDelegate.drinksAssetName)
        let builder = Builder.App(with: window, store: store)
        builder.run()
        let tabBarBuilder = builder.getTabBarBuilder()
        let tabBar = tabBarBuilder.getTabBar()
        let builders = tabBarBuilder.getBuilders()
        let controllersCount = tabBar.viewControllers?.count ?? 0
        XCTAssert(controllersCount == builders.count)
    }
}

extension Builder.App {
    func getTabBarBuilder() -> Builder.TabBar {
        return tabBarBuilder
    }
}
