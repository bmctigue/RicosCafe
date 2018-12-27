//
//  Protocols.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/26/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import Foundation

protocol Store {
    func fetchItems<T>(completionHandler: @escaping ([T]) -> Void)
}
