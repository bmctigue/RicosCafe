//
//  ProductStoreTests.swift
//  RicosCafeTests
//
//  Created by Bruce McTigue on 12/28/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import XCTest
@testable import RicosCafe

class LocalStoreTests: XCTestCase {
    
    let assetName = "productsJson"
    var fetchedData: Data?
    var error: StoreError?
    
    func testLocalStore() {
        let expectation = self.expectation(description: "fetchData")
        let sut = LocalStore(assetName)
        let request = Request()
        sut.fetchData(request) {[weak self] result in
            switch result {
            case .success(let data):
                self?.fetchedData = data
            case .error:
                XCTFail()
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3.0, handler: nil)
        XCTAssertNotNil(fetchedData)
    }
    
    func testLocalStoreBadAsset() {
        let expectation = self.expectation(description: "fetchData")
        let sut = LocalStore("badAssetName")
        let request = Request()
        sut.fetchData(request) {[weak self] result in
            switch result {
            case .success(let data):
                self?.fetchedData = data
            case .error(let error):
                self?.error = error
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3.0, handler: nil)
        XCTAssertNotNil(error)
    }
}
