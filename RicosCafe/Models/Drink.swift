//
//  Drink.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/26/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit
import Unbox

enum DrinkSizeType: Int, UnboxableEnum {
    case small
    case medium
    case large
}

enum DrinkTempType: Int, UnboxableEnum {
    case hot
    case cold
    case frozen
}

struct Drink {
    var name: String
    var text: String
    var price: String
    var size: DrinkSizeType
    var temp: DrinkTempType
    var imageUrl: String
    var image: String
}

extension Drink: Unboxable {
    init(unboxer: Unboxer) throws {
        self.name = try unboxer.unbox(key: "name")
        self.text = try unboxer.unbox(key: "text")
        self.price = try unboxer.unbox(key: "price")
        self.size = try unboxer.unbox(key: "size")
        self.temp = try unboxer.unbox(key: "temp")
        self.imageUrl = try unboxer.unbox(key: "image_url")
        self.image = try unboxer.unbox(key: "image")
    }
}
