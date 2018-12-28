//
//  DrinksServiceTests.swift
//  RicosCafeTests
//
//  Created by Bruce McTigue on 12/28/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import XCTest
@testable import RicosCafe

class DrinksServiceTests: XCTestCase {
    
    let assetName = "drinksJson"

    func testService() {
        let expectation = self.expectation(description: "fetchItems")
        var results = [Drink]()
        let store = Drinks.LocalStore(assetName)
        let sut = Drinks.Service(store)
        sut.fetchItems { drinks in
            results = drinks as! [Drink]
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3.0, handler: nil)
        XCTAssert(results.count > 0)
    }
    
    func testServiceBadAsset() {
        let expectation = self.expectation(description: "fetchItems")
        var results = [Drink]()
        let store = Drinks.LocalStore("badAssetName")
        let sut = Drinks.Service(store)
        sut.fetchItems { drinks in
            results = drinks as! [Drink]
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3.0, handler: nil)
        XCTAssert(results.count == 0)
    }
}
