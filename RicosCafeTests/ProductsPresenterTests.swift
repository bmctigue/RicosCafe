//
//  ProductsPresenterTests.swift
//  RicosCafeTests
//
//  Created by Bruce McTigue on 12/26/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import XCTest
@testable import RicosCafe
@testable import Tiguer

class ProductsPresenterTests: XCTestCase {
    
    let drink1 = Product(productId: "1", name: "Product1", text: "Product1", price: "1.99", type: .drink, imageUrl: "", image: "")
    let drink2 = Product(productId: "2", name: "Product2", text: "Product2", price: "2.99", type: .drink, imageUrl: "", image: "")
    
    func testDisplayedProducts() {
        let sut = Products.Presenter<Product, Products.ViewModel>([], main: SyncQueue.global, background: SyncQueue.background)
        XCTAssert(sut.viewModels.count == 0)
    }
    
    func testInitWithDisplayedProducts() {
        let models = [drink1, drink2]
        let sut = Products.Presenter<Product, Products.ViewModel>(models, main: SyncQueue.global, background: SyncQueue.background)
        let expectation = self.expectation(description: "testUpdateViewModels")
        let dynamicModels = sut.getDynamicModels()
        dynamicModels.addAndNotify(observer: self) {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3.0, handler: nil)
        XCTAssert(sut.viewModels.count == models.count)
    }

    func testUpdateDisplayedProducts() {
        let models = [drink1, drink2]
        let sut = Products.Presenter<Product, Products.ViewModel>([], main: SyncQueue.global, background: SyncQueue.background)
        var resultProducts = [Products.ViewModel]()
        let expectation = self.expectation(description: "testUpdateViewModels")
        let dynamicModels = sut.getDynamicModels()
        dynamicModels.addObserver(self) {
            resultProducts = dynamicModels.value
            expectation.fulfill()
        }
        let response = Response(models)
        sut.updateViewModels(response)
        waitForExpectations(timeout: 3.0, handler: nil)
        XCTAssert(resultProducts.count == models.count)
    }
}
