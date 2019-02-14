//
//  ProductsInteractorTests.swift
//  RicosCafeTests
//
//  Created by Bruce McTigue on 1/4/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import XCTest
@testable import RicosCafe
@testable import Tiguer

class ProductsInteractorTests: XCTestCase {
    
    typealias ViewModel = Products.ViewModel
    
    private lazy var store = LocalStore(Builder.App.productsAssetName)
    private lazy var dataAdapter = Products.UnboxDataAdapter<Product>()
    private lazy var service = Products.Service<Product, Products.UnboxDataAdapter>(store, dataAdapter: dataAdapter, cacheKey: Products.Builder.cacheKey)
    private lazy var presenter = Products.Presenter<Product, Products.ViewModel>([])
    var viewModels = [ViewModel]()

    func testFetchItemsForDrinks() {
        let expectation = self.expectation(description: "fetch")
        let presenter = Products.Presenter<Product, Products.ViewModel>([])
        let interactor = Products.Interactor<Product, Products.Presenter, Products.Service>(presenter, service: service, state: .drink)
        let dynamicModels = presenter.getDynamicModels()
        dynamicModels.addObserver(self) { [weak self] in
            self?.viewModels = dynamicModels.value
            expectation.fulfill()
        }
        let request = Request()
        let urlGenerator = LocalDataUrlGenerator(request)
        let url = urlGenerator.url()!
        interactor.fetchItems(request, url: url)
        waitForExpectations(timeout: 3.0, handler: nil)
        XCTAssertNotNil(viewModels.count == 4)
    }
    
    func testFetchItemsForEntree() {
        let expectation = self.expectation(description: "fetch")
        let presenter = Products.Presenter<Product, Products.ViewModel>([])
        let interactor = Products.Interactor<Product, Products.Presenter, Products.Service>(presenter, service: service, state: .entree)
        let dynamicModels = presenter.getDynamicModels()
        dynamicModels.addObserver(self) { [weak self] in
            self?.viewModels = dynamicModels.value
            expectation.fulfill()
        }
        let request = Request()
        let urlGenerator = LocalDataUrlGenerator(request)
        let url = urlGenerator.url()!
        interactor.fetchItems(request, url: url)
        waitForExpectations(timeout: 3.0, handler: nil)
        XCTAssertNotNil(viewModels.count == 3)
    }
    
    func testFetchItemsForDessert() {
        let expectation = self.expectation(description: "fetch")
        let presenter = Products.Presenter<Product, Products.ViewModel>([])
        let interactor = Products.Interactor<Product, Products.Presenter, Products.Service>(presenter, service: service, state: .dessert)
        let dynamicModels = presenter.getDynamicModels()
        dynamicModels.addObserver(self) { [weak self] in
            self?.viewModels = dynamicModels.value
            expectation.fulfill()
        }
        let request = Request()
        let urlGenerator = LocalDataUrlGenerator(request)
        let url = urlGenerator.url()!
        interactor.fetchItems(request, url: url)
        waitForExpectations(timeout: 3.0, handler: nil)
        XCTAssertNotNil(viewModels.count == 3)
    }
}
