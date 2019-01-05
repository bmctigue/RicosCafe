//
//  ProductsInteractorTests.swift
//  RicosCafeTests
//
//  Created by Bruce McTigue on 1/4/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import XCTest
@testable import RicosCafe

class ProductsInteractorTests: XCTestCase {
    
    typealias ViewModel = Products.ViewModel
    
    private lazy var store = LocalStore(Builder.App.productsAssetName)
    private lazy var dataAdapter = UnboxDataAdapter<Product>()
    private lazy var service = Service(store, dataAdapter: dataAdapter)
    private lazy var presenter = Products.Presenter([])
    var viewModels = [ViewModel]()

    func testFetchItemsForDrinks() {
        let expectation = self.expectation(description: "fetch")
        let presenter = Products.Presenter([])
        let interactor = Products.Interactor(service, presenter: presenter, state: .drink)
        let dynamicModels = presenter.getDynamicModels()
        dynamicModels.addObserver(self) { [weak self] in
            self?.viewModels = dynamicModels.value
            expectation.fulfill()
        }
        interactor.fetchItems(Request())
        waitForExpectations(timeout: 3.0, handler: nil)
        XCTAssertNotNil(viewModels.count == 4)
    }
    
    func testFetchItemsForEntree() {
        let expectation = self.expectation(description: "fetch")
        let presenter = Products.Presenter([])
        let interactor = Products.Interactor(service, presenter: presenter, state: .entree)
        let dynamicModels = presenter.getDynamicModels()
        dynamicModels.addObserver(self) { [weak self] in
            self?.viewModels = dynamicModels.value
            expectation.fulfill()
        }
        interactor.fetchItems(Request())
        waitForExpectations(timeout: 3.0, handler: nil)
        XCTAssertNotNil(viewModels.count == 3)
    }
    
    func testFetchItemsForDessert() {
        let expectation = self.expectation(description: "fetch")
        let presenter = Products.Presenter([])
        let interactor = Products.Interactor(service, presenter: presenter, state: .dessert)
        let dynamicModels = presenter.getDynamicModels()
        dynamicModels.addObserver(self) { [weak self] in
            self?.viewModels = dynamicModels.value
            expectation.fulfill()
        }
        interactor.fetchItems(Request())
        waitForExpectations(timeout: 3.0, handler: nil)
        XCTAssertNotNil(viewModels.count == 3)
    }
}
