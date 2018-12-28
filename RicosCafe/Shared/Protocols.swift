//
//  Protocols.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/26/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit
import Unbox

protocol BaseBuilder: class {
    func run()
}

protocol VCBuilder: class {
    func run(completionHandler: VCBuilderBlock)
}

protocol TabBuilder: VCBuilder {
    func getImageName() -> String
    func getTitle() -> String
}

protocol StoreProtocol {
    associatedtype T
    func fetchItems<T>(completionHandler: @escaping ([T]) -> Void)
}

protocol LocalStoreProtocol: StoreProtocol {
    func itemsFromBundle(_ assetName: String) -> [T]
}

protocol InteractorProtocol {
    func fetchItems()
}
