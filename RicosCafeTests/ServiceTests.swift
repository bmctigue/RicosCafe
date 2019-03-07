//
//  ProductsServiceTests.swift
//  RicosCafeTests
//
//  Created by Bruce McTigue on 12/28/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import XCTest
@testable import RicosCafe
@testable import Tiguer

class ServiceTests: XCTestCase {
    
    let assetName = Builder.App.productsAssetName
    let badAssetName = "badAssetName"
    lazy var dataAdapter = Products.UnboxDataAdapter<Product>()

    func testService() {
        let expectation = self.expectation(description: "fetchItems")
        var results = [Product]()
        let store = LocalStore(assetName)
        let request = Request()
        
        let sut = Products.Service<Product, Products.UnboxDataAdapter>(store, dataAdapter: dataAdapter, cacheKey: Products.Builder.cacheKey)
        sut.fetchItems(request, url: nil) { drinks in
            results = drinks
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3.0, handler: nil)
        XCTAssert(results.count > 0)
    }
    
    func testServiceBadAsset() {
        let expectation = self.expectation(description: "fetchItems")
        var results = [Product]()
        let testBundle = Bundle(for: type(of: self))
        let store = LocalStore(badAssetName, bundle: testBundle)
        let sut = Products.Service<Product, Products.UnboxDataAdapter>(store, dataAdapter: dataAdapter, cacheKey: Products.Builder.cacheKey)
        sut.updateCacheTestingState(.testing)
        var request = Request()
        request.params[Tiguer.Constants.forceKey] = "true"
        sut.fetchItems(request, url: nil) { drinks in
            results = drinks
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3.0, handler: nil)
        XCTAssert(results.count == 0)
    }
}
