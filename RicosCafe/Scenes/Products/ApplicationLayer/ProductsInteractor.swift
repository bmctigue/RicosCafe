//
//  ProductsInteractor.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/27/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import Foundation

extension Products {
    final class Interactor<ServProtocol: ServiceProtocol>: InteractorProtocol {
        
        typealias Model = Product
        typealias Presenter =  Products.Presenter
        
        private var service: ServProtocol
        private var presenter: Presenter
        private var state: AppState
        
        init(_ service: ServProtocol, presenter: Presenter, state: AppState) {
            self.service = service
            self.presenter = presenter
            self.state = state
        }
        
        func fetchItems(_ request: Request) {
            service.fetchItems(request) { [weak self] models in
                let models = models as! [Model]
                if let self = self {
                    let filteredModels = self.filterModelsByState(models, state: self.state)
                    let response = Response(models: filteredModels)
                    self.presenter.updateViewModels(response)
                }
            }
        }
        
        private func filterModelsByState(_ models: [Model], state: AppState) -> [Model] {
            var filteredModels = [Model]()
            switch state {
            case .drink:
                filteredModels = models.filter { $0.type == .drink }
            case .entree:
                filteredModels = models.filter { $0.type == .entree }
            case .dessert:
                filteredModels = models.filter { $0.type == .dessert }
            }
            return filteredModels
        }
    }
}
