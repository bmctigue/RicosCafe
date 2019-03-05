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
            let productModels = models as! [Product]
            for model in productModels {
                let displayedModel = Products.ViewModel(productId: model.productId, name: model.name, text: model.text, price: model.price, type: model.type, imageUrl: model.imageUrl, image: model.image, ordered: model.ordered, quantity: model.quantity)
                resultModels.append(displayedModel as! ViewModel)
            }
            return resultModels
        }
        
        override func updatedViewModels(completionHandler: @escaping ([ViewModel]) -> Void) {
            background.dispatch {
                self.viewModels = self.filterModelsByState(self.viewModels, state: self.state).map { $0 }
                self.main.dispatch {
                    completionHandler(self.viewModels)
                }
            }
        }
        
        private func filterModelsByState(_ viewModels: [ViewModel], state: AppState) -> [ViewModel] {
            let viewModels = viewModels as! [Products.ViewModel]
            var filteredModels = [ViewModel]() as! [Products.ViewModel]
            switch state {
            case .drink:
                filteredModels = viewModels.filter { $0.type == .drink }
            case .entree:
                filteredModels = viewModels.filter { $0.type == .entree }
            case .dessert:
                filteredModels = viewModels.filter { $0.type == .dessert }
            case .orders:
                filteredModels = viewModels.filter { $0.ordered == true }
            }
            return filteredModels as! [ViewModel]
        }
    }
}
