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
    func fetchItems(completionHandler: @escaping ([Any]) -> Void)
}

enum StoreError: Error {
    case fetchDataFailed
}

enum Store {
    enum Result {
        case success(Data)
        case error(StoreError)
    }
}

protocol StoreProtocol {
    func fetchData(completionHandler: @escaping (Store.Result) -> Void)
}

protocol InteractorProtocol {
    func fetchItems()
}

enum DataAdapterError: Error {
    case conversionFailed
}

enum DataAdapter {
    enum Result<Model> {
        case success([Model])
        case error(DataAdapterError)
    }
}

protocol DataAdapterProtocol {
    associatedtype Model
    func itemsFromData(_ data: Data, completionHandler: @escaping (DataAdapter.Result<Model>) -> Void)
}


