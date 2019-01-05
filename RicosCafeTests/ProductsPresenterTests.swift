//
//  ProductsPresenterTests.swift
//  RicosCafeTests
//
//  Created by Bruce McTigue on 12/26/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import XCTest
@testable import RicosCafe

class ProductsPresenterTests: XCTestCase {
    
    let drink1 = Product(name: "Product1", text: "Product1", price: "1.99", type: .drink, size: .small, temp: .hot, imageUrl: "", image: "")
    let drink2 = Product(name: "Product2", text: "Product2", price: "2.99", type: .drink, size: .medium, temp: .hot, imageUrl: "", image: "")
    
    func testDisplayedProducts() {
        let presenter = Products.Presenter()
        XCTAssert(presenter.viewModels.count == 0)
    }
    
    func testInitWithDisplayedProducts() {
        let models = [drink1, drink2]
        let presenter = Products.Presenter(models)
        var resultProducts = [Products.ViewModel]()
        let expectation = self.expectation(description: "testUpdateViewModels")
        let dynamicModels = presenter.getDynamicModels()
        dynamicModels.addAndNotify(observer: self) {
            resultProducts = dynamicModels.value
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3.0, handler: nil)
        XCTAssert(presenter.viewModels.count == models.count)
        XCTAssert(resultProducts.count == models.count)
    }

    func testUpdateDisplayedProducts() {
        let models = [drink1, drink2]
        var presenter = Products.Presenter()
        var resultProducts = [Products.ViewModel]()
        let expectation = self.expectation(description: "testUpdateViewModels")
        let dynamicModels = presenter.getDynamicModels()
        dynamicModels.addObserver(self) {
            resultProducts = dynamicModels.value
            expectation.fulfill()
        }
        let response = Response(models: models)
        presenter.updateViewModels(response)
        waitForExpectations(timeout: 3.0, handler: nil)
        XCTAssert(resultProducts.count == models.count)
    }
}
