//
//  Protocols.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/26/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit

typealias VCBuilderBlock = ((UIViewController) -> Void)
typealias TabBarBuilderBlock = ((UITabBarController) -> Void)

protocol BaseBuilder: class {
    func run()
}

protocol VCBuilder: class {
    func run(completionHandler: VCBuilderBlock)
}

protocol TabBarBuilder: class {
    func run(completionHandler: TabBarBuilderBlock)
}

protocol TabBuilder: VCBuilder {
    func getImageName() -> String
    func getTitle() -> String
}

protocol DataAdapterProtocol {
    associatedtype Model
    func itemsFromData(_ data: Data, completionHandler: @escaping (DataAdapter.Result<Model>) -> Void)
}

protocol StoreProtocol {
    func fetchData(_ request: Request, completionHandler: @escaping (Store.Result) -> Void)
}

protocol ServiceProtocol {
    associatedtype Model
    func fetchItems(_ request: Request, completionHandler: @escaping ([Model]) -> Void)
}

protocol InteractorProtocol: class {
    typealias Model = Drink
    typealias Presenter =  Drinks.Presenter
    func fetchItems(_ request: Request)
}

protocol PresenterProtocol {
    associatedtype Model
    associatedtype ViewModel
    var models: [Model] { get set }
    var viewModels: [ViewModel] { get }
    var dynamicModels: DynamicValue<[ViewModel]> { get set }
}

extension PresenterProtocol {
    mutating func updateViewModels(_ response: Response<Model>) {
        self.models = response.models
        self.dynamicModels.value = viewModels
    }
}
