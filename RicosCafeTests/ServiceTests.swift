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
    lazy var dataAdapter = Products.UnboxDataAdapter<Product>()

    func testService() {
        let expectation = self.expectation(description: "fetchItems")
        var results = [Product]()
        let store = LocalStore(assetName)
        let request = Request()
        
        let sut = Products.Service<Product, Products.UnboxDataAdapter>(store, dataAdapter: dataAdapter, cacheKey: Products.Builder.cacheKey)
        let urlGenerator = LocalDataUrlGenerator(request)
        let url = urlGenerator.url()!
        sut.fetchItems(request, url: url) { drinks in
            results = drinks as! [Product]
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3.0, handler: nil)
        XCTAssert(results.count > 0)
    }
    
    func testServiceBadAsset() {
        let expectation = self.expectation(description: "fetchItems")
        var results = [Product]()
        let store = LocalStore("badAssetName")
        let sut = Products.Service<Product, Products.UnboxDataAdapter>(store, dataAdapter: dataAdapter, cacheKey: Products.Builder.cacheKey)
        let request = Request()
        let urlGenerator = LocalDataUrlGenerator(request)
        let url = urlGenerator.url()!
        sut.fetchItems(request, url: url) { drinks in
            results = drinks as! [Product]
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3.0, handler: nil)
        XCTAssert(results.count == 0)
    }
}
