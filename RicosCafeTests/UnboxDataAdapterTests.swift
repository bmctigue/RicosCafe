//
//  UnboxDataAdapterTests.swift
//  RicosCafeTests
//
//  Created by Bruce McTigue on 12/30/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import XCTest
@testable import RicosCafe
@testable import Tiguer

class UnboxDataAdapterTests: XCTestCase {
    
    let assetName = "productsJson"
    var error: StoreError?
    var items: [Product] = [Product]()
    lazy var sut = Products.UnboxDataAdapter<Product>()
    
    override func setUp() {
        items = [Product]()
    }

    func testAdapter() {
        let expectation = self.expectation(description: "adapter")
        if let asset = NSDataAsset(name: assetName, bundle: Bundle.main) {
            sut.itemsFromData(asset.data).finally(queue: .main) { future in
                switch future.state {
                case .result(let adapterResult):
                    switch adapterResult {
                    case .success(let items):
                        self.items = items
                    }
                case .error(let error):
                    print(error)
                    XCTFail()
                case .cancelled:
                    XCTFail()
                case .unresolved:
                    XCTFail()
                }
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 3.0, handler: nil)
        XCTAssert(items.count > 0)
    }
}
