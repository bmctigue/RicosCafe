//
//  DrinksBuilder.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/25/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import Foundation

enum Drinks {
    final class Builder: TabBuilder {
        
        private var imageName: String
        private var title: String
        
        private var store: StoreProtocol
        private lazy var service = Drinks.Service(store)
        private lazy var viewModel = Drinks.ViewModel()
        private lazy var interactor = Drinks.Interactor(service, viewModel: viewModel)
        
        init(with imageName: String, title: String, store: StoreProtocol) {
            self.imageName = imageName
            self.title = title
            self.store = store
        }
        
        func getImageName() -> String {
            return imageName
        }
        
        func getTitle() -> String {
            return title
        }
        
        func run(completionHandler: VCBuilderBlock) {
            let controller = Drinks.ViewController(with: interactor, viewModel: viewModel)
            completionHandler(controller)
        }
    }
}
