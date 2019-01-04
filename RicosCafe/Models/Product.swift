//
//  Product.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/26/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit
import Unbox

enum ProductType: Int, UnboxableEnum {
    case drink
    case entree
    case dessert
}

enum ProductSizeType: Int, UnboxableEnum {
    case small
    case medium
    case large
}

enum ProductTempType: Int, UnboxableEnum {
    case hot
    case cold
    case frozen
}

struct Product {
    var name: String
    var text: String
    var price: String
    var type: ProductType
    var size: ProductSizeType
    var temp: ProductTempType
    var imageUrl: String
    var image: String
}

extension Product: Unboxable {
    init(unboxer: Unboxer) throws {
        self.name = try unboxer.unbox(key: "name")
        self.text = try unboxer.unbox(key: "text")
        self.price = try unboxer.unbox(key: "price")
        self.type = try unboxer.unbox(key: "type")
        self.size = try unboxer.unbox(key: "size")
        self.temp = try unboxer.unbox(key: "temp")
        self.imageUrl = try unboxer.unbox(key: "image_url")
        self.image = try unboxer.unbox(key: "image")
    }
}
