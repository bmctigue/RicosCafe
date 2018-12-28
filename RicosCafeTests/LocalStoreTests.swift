//
//  DrinkStoreTests.swift
//  RicosCafeTests
//
//  Created by Bruce McTigue on 12/28/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import XCTest
@testable import RicosCafe

class LocalStoreTests: XCTestCase {
    
    let assetName = "drinksJson"
    var fetchedData: Data?
    
    func testLocalStore() {
        let expectation = self.expectation(description: "fetchData")
        let sut = LocalStore(assetName)
        sut.fetchData {[weak self] data in
            self?.fetchedData = data
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3.0, handler: nil)
        XCTAssertNotNil(fetchedData)
    }
    
    func testLocalStoreBadAsset() {
        let expectation = self.expectation(description: "fetchData")
        let sut = LocalStore("badAssetName")
        sut.fetchData {[weak self] data in
            self?.fetchedData = data
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3.0, handler: nil)
        XCTAssertNil(fetchedData)
    }
}
