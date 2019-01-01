//
//  DrinksPresenterTests.swift
//  RicosCafeTests
//
//  Created by Bruce McTigue on 12/26/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import XCTest
@testable import RicosCafe

class DrinksPresenterTests: XCTestCase {
    
    let drink1 = Drink(name: "Drink1", text: "Drink1", price: "1.99", size: .small, temp: .hot, imageUrl: "", image: "")
    let drink2 = Drink(name: "Drink2", text: "Drink2", price: "2.99", size: .medium, temp: .hot, imageUrl: "", image: "")
    
    func testDisplayedDrinks() {
        let presenter = Drinks.Presenter()
        XCTAssert(presenter.getDisplayedModels().count == 0)
    }
    
    func testInitWithDisplayedDrinks() {
        let models = [drink1,drink2]
        let presenter = Drinks.Presenter(models)
        var resultDrinks = [Drinks.ViewModel.DisplayedModel]()
        let expectation = self.expectation(description: "testUpdateDisplayedModels")
        let dynamicModels = presenter.dynamicModels
        dynamicModels.addAndNotify(observer: self) {
            resultDrinks = dynamicModels.value
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3.0, handler: nil)
        XCTAssert(presenter.getDisplayedModels().count == models.count)
        XCTAssert(resultDrinks.count == models.count)
    }

    func testUpdateDisplayedDrinks() {
        let models = [drink1,drink2]
        var presenter = Drinks.Presenter()
        var resultDrinks = [Drinks.ViewModel.DisplayedModel]()
        let expectation = self.expectation(description: "testUpdateDisplayedModels")
        let dynamicModels = presenter.dynamicModels
        dynamicModels.addObserver(self) {
            resultDrinks = dynamicModels.value
            expectation.fulfill()
        }
        let response = Response(models: models)
        presenter.updateDisplayedModels(response)
        waitForExpectations(timeout: 3.0, handler: nil)
        XCTAssert(resultDrinks.count == models.count)
    }

}
