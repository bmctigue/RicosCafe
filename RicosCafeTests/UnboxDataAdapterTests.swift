//
//  UnboxDataAdapterTests.swift
//  RicosCafeTests
//
//  Created by Bruce McTigue on 12/30/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import XCTest
@testable import RicosCafe

class UnboxDataAdapterTests: XCTestCase {
    
    let assetName = "drinksJson"
    var error: StoreError?
    var items: [Drink] = [Drink]()
    lazy var sut = UnboxDataAdapter<Drink>()
    
    override func setUp() {
        items = [Drink]()
    }

    func testAdapter() {
        let expectation = self.expectation(description: "adapter")
        let store = LocalStore(assetName)
        
        store.fetchData {[weak self] result in
            switch(result) {
            case .success(let data):
                self?.items = self?.sut.itemsFromData(data) ?? []
            case .error(_):
                XCTFail()
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3.0, handler: nil)
        XCTAssert(items.count > 0)
    }
    
    func testAdapterBadData() {
        let expectation = self.expectation(description: "adapter")
        let store = LocalStore("badAssetName")
        
        store.fetchData {[weak self] result in
            switch(result) {
            case .success(let data):
                self?.items = self?.sut.itemsFromData(data) ?? []
            case .error(let error):
                let data = Data()
                self?.items = self?.sut.itemsFromData(data) ?? []
                self?.error = error
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3.0, handler: nil)
        XCTAssertNotNil(error)
    }

}
