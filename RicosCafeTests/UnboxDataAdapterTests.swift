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
        let request = Request()
        
        store.fetchData(request) {[weak self] result in
            switch result {
            case .success(let data):
                self?.sut.itemsFromData(data) { adapterResult in
                    switch adapterResult {
                    case .success(let items):
                        self?.items = items
                    case .error:
                        XCTFail()
                    }
                }
            case .error:
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
        let request = Request()
        
        store.fetchData(request) {[weak self] result in
            switch result {
            case .success(let data):
                self?.sut.itemsFromData(data) { adapterResult in
                    switch adapterResult {
                    case .success(let items):
                        self?.items = items
                    case .error:
                        XCTFail()
                    }
                }
            case .error(let error):
                let data = Data()
                self?.sut.itemsFromData(data) { adapterResult in
                    switch adapterResult {
                    case .success(let items):
                        self?.items = items
                    case .error:
                        self?.error = error
                    }
                }
                self?.error = error
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3.0, handler: nil)
        XCTAssertNotNil(error)
    }

}
