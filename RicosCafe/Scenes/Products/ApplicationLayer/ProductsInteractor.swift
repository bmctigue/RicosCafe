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
        
        init(_ service: ServProtocol, presenter: Presenter) {
            self.service = service
            self.presenter = presenter
        }
        
        func fetchItems(_ request: Request) {
            service.fetchItems(request) { [weak self] models in
                let response = Response(models: models as! [Model])
                self?.presenter.updateViewModels(response)
            }
        }
    }
}
