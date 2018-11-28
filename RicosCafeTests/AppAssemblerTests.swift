//
//  AppAssemblerTests.swift
//  RicosCafeTests
//
//  Created by Bruce McTigue on 11/28/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import XCTest
@testable import RicosCafe

class AppAssemblerTests: XCTestCase {
    
    func testAppAssembler() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let assembler = AppAssembler(with: window)
        assembler.run()
        let tabBarAssembler = assembler.getTabBarAssembler()
        let tabBar = tabBarAssembler.getTabBar()
        let assemblers = tabBarAssembler.getAssemblers()
        let controllersCount = tabBar.viewControllers?.count ?? 0
        XCTAssert(controllersCount == assemblers.count)
    }
}

extension AppAssembler {
    func getTabBarAssembler() -> TabBarAssembler {
        return tabBarAssembler
    }
}
