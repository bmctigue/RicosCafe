//
//  ProductsBuilder.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/25/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import Foundation
import Tiguer

enum Products {
    final class Builder: TabBuilder {
        
        private var imageName: String
        private var title: String
        static let cacheKey = "products"
        
        private var state: AppState
        private var store: StoreProtocol
        private lazy var dataAdapter = UnboxDataAdapter<Product>()
        private lazy var service = Service<Product, UnboxDataAdapter>(store, dataAdapter: dataAdapter, cacheKey: Products.Builder.cacheKey)
        private lazy var presenter = Products.Presenter<Product, Products.ViewModel>([])
        private lazy var interactor = Products.Interactor<Product, Products.Presenter, Products.Service>(presenter, service: service, state: state)
        private lazy var tableViewController = ProductsTableViewController(with: interactor, presenter: presenter)
        
        init(with imageName: String, title: String, store: StoreProtocol, state: AppState) {
            self.imageName = imageName
            self.title = title
            self.store = store
            self.state = state
        }
        
        func getImageName() -> String {
            return imageName
        }
        
        func getTitle() -> String {
            return title
        }
        
        func run(completionHandler: VCBuilderBlock) {
            let controller = ProductsViewController(with: tableViewController)
            completionHandler(controller)
        }
    }
}
