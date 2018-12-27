//
//  DrinksViewModelTests.swift
//  RicosCafeTests
//
//  Created by Bruce McTigue on 12/26/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import XCTest
@testable import RicosCafe

class DrinksViewModelTests: XCTestCase {
    
    let drink1 = Drink(name: "Drink1", text: "Drink1", price: 100, size: 0, temp: 0, imageUrl: "", image: "")
    let drink2 = Drink(name: "Drink2", text: "Drink2", price: 50, size: 1, temp: 0, imageUrl: "", image: "")
    
    func testDisplayedDrinks() {
        let viewModel = Drinks.ViewModel()
        XCTAssert(viewModel.getDisplayedDrinks().count == 0)
    }
    
    func testInitWithDisplayedDrinks() {
        let drinks = [drink1,drink2]
        let viewModel = Drinks.ViewModel(drinks)
        var resultDrinks = [Drinks.ViewModel.DisplayedDrink]()
        let expectation = self.expectation(description: "testUpdateDisplayedDrinks")
        let dynamicDrinks = viewModel.dynamicDrinks
        dynamicDrinks.addAndNotify(observer: self) {
            resultDrinks = dynamicDrinks.value
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3.0, handler: nil)
        XCTAssert(viewModel.getDisplayedDrinks().count == drinks.count)
        XCTAssert(resultDrinks.count == drinks.count)
    }

    func testUpdateDisplayedDrinks() {
        let drinks = [drink1,drink2]
        var viewModel = Drinks.ViewModel()
        var resultDrinks = [Drinks.ViewModel.DisplayedDrink]()
        let expectation = self.expectation(description: "testUpdateDisplayedDrinks")
        let dynamicDrinks = viewModel.dynamicDrinks
        dynamicDrinks.addObserver(self) {
            resultDrinks = dynamicDrinks.value
            expectation.fulfill()
        }
        viewModel.updateDisplayedDrinks(drinks)
        waitForExpectations(timeout: 3.0, handler: nil)
        XCTAssert(resultDrinks.count == drinks.count)
    }

}
