//
//  ProductsBuilderTests.swift
//  RicosCafeTests
//
//  Created by Bruce McTigue on 12/30/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import XCTest
@testable import RicosCafe

class ProductsBuilderTests: XCTestCase {
    
    lazy var store = LocalStore(Builder.App.productsAssetName)
    var resultController: ProductsViewController?

    func testProductsBuilder() {
        let expectation = self.expectation(description: "run")
        let sut = Products.Builder.init(with: "test", title: "test", store: store, state: .drinks)
        sut.run { controller in 
            resultController = controller as? ProductsViewController
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3.0, handler: nil)
        XCTAssertNotNil(resultController)
    }

}
