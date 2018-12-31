//
//  DataAdapter.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/30/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import Foundation

protocol DataAdapter {
    associatedtype Model
    func itemsFromData(_ data: Data) -> [Model]
}
