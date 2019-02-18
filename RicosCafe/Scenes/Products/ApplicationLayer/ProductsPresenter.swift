//
//  ProductsPresenter.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/31/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit
import Tiguer

extension Products {
    final class Presenter<Model, ViewModel>: Tiguer.Presenter<Model, ViewModel> {
        
        private var state: AppState
        
        public init(_ models: [Model] = [Model](), state: AppState, main: Dispatching = AsyncQueue.main, background: Dispatching = AsyncQueue.background) {
            self.state = state
            super.init(models, main: main, background: background)
        }
        
        override var baseViewModels: [ViewModel] {
            var resultModels = [ViewModel]()
            var productModels = models as! [Product]
            productModels = self.filterModelsByState(models, state: self.state).map { $0 } as! [Product]
            for model in productModels {
                let displayedModel = Products.ViewModel(productId: model.productId, name: model.name, text: model.text, price: model.price, imageUrl: model.imageUrl, image: model.image)
                resultModels.append(displayedModel as! ViewModel)
            }
            return resultModels
        }
        
        override func updatedViewModels(completionHandler: @escaping ([ViewModel]) -> Void) {
            background.dispatch {
                self.main.dispatch {
                    completionHandler(self.viewModels)
                }
            }
        }
        
        private func filterModelsByState(_ models: [Model], state: AppState) -> [Model] {
            let productModels = models as! [Product]
            var filteredModels = [Product]()
            switch state {
            case .drink:
                filteredModels = productModels.filter { $0.type == .drink }
            case .entree:
                filteredModels = productModels.filter { $0.type == .entree }
            case .dessert:
                filteredModels = productModels.filter { $0.type == .dessert }
            }
            return filteredModels as! [Model]
        }
    }
}
