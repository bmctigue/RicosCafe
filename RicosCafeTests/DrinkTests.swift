//
//  DrinkTests.swift
//  RicosCafeTests
//
//  Created by Bruce McTigue on 12/26/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import XCTest
@testable import RicosCafe

class DrinkTests: XCTestCase {

    func testInit() {
        let name = "Latte"
        let drink = Drink(name: name, text: "Coffee with Milk", price: "1.99", size: .small, temp: .hot, imageUrl: "", image: "")
        XCTAssert(drink.name == name)
    }
    
    func testLocalStore() {
        var results = [Drink]()
        let sut = Drinks.LocalStore()
        sut.fetchItems { drinks in
            results = drinks
        }
        print(results)
        XCTAssert(results.count > 0)
    }
}
