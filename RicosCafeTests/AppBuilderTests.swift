//
//  AppBuilderTests.swift
//  RicosCafeTests
//
//  Created by Bruce McTigue on 11/28/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import XCTest
@testable import RicosCafe
@testable import Tiguer

class AppBuilderTests: XCTestCase {
    
    var buildersCount = 0
    
    func testAppBuilder() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let builder = Builder.App(with: window)
        builder.run()
        buildersCount = builder.configureBuilders().count
        XCTAssert(buildersCount > 0)
    }
}
