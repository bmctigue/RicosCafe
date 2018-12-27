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
        let drink = Drink(name: name, text: "Coffee with Milk", price: 50, size: 0, imageUrl: nil, image: nil)
        XCTAssert(drink.name == name)
    }
}
