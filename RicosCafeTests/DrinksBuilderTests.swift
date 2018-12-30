//
//  DrinksBuilderTests.swift
//  RicosCafeTests
//
//  Created by Bruce McTigue on 12/30/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import XCTest
@testable import RicosCafe

class DrinksBuilderTests: XCTestCase {
    
    lazy var store = LocalStore(Builder.App.drinksAssetName)
    var resultController: Drinks.ViewController?

    func testDrinksBuilder() {
        let expectation = self.expectation(description: "run")
        let sut = Drinks.Builder.init(with: "test", title: "test", store: store)
        sut.run { controller in 
            resultController = controller as? Drinks.ViewController
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3.0, handler: nil)
        XCTAssertNotNil(resultController)
    }

}
