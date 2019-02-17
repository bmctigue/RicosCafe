//
//  ProductsInteractor.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/27/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import Foundation
import Tiguer

extension Products {
    
    final class Interactor<Model, Presenter: PresenterProtocol, Service: ServiceProtocol>: Tiguer.Interactor<Model, Presenter, Service> {
        
        private var state: AppState
        
        init(_ presenter: Presenter, service: Service, state: AppState) {
            self.state = state
            super.init(presenter, service: service)
        }
        
        override func fetchItems(_ request: Request, url: URL) {
            service.fetchItems(request, url: url) { [weak self] models in
                let models = models as! [Model]
                if let self = self {
                    let filteredModels = self.filterModelsByState(models, state: self.state).map { $0 as! Presenter.Model }
                    let response = Response(filteredModels)
                    self.presenter.updateViewModels(response)
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
