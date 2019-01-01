//
//  Protocols.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/26/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit

typealias VCBuilderBlock = ((UIViewController) -> Void)

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

protocol ServiceProtocol {
    func fetchItems(_ request: Request, completionHandler: @escaping ([Any]) -> Void)
}

protocol StoreProtocol {
    func fetchData(_ request: Request, completionHandler: @escaping (Store.Result) -> Void)
}

protocol InteractorProtocol {
    func fetchItems(_ request: Request)
}

protocol DataAdapterProtocol {
    associatedtype Model
    func itemsFromData(_ data: Data, completionHandler: @escaping (DataAdapter.Result<Model>) -> Void)
}


