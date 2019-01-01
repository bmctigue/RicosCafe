//
//  DrinksInteractor.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/27/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import Foundation

extension Drinks {
    final class Interactor<ServProtocol:ServiceProtocol>: InteractorProtocol {
        
        private var service: ServProtocol
        private var presenter: Drinks.Presenter
        
        init(_ service: ServProtocol, presenter: Drinks.Presenter) {
            self.service = service
            self.presenter = presenter
        }
        
        func fetchItems(_ request: Request) {
            service.fetchItems(request) { [weak self] models in
                let response = Response(models: models as! [Drink])
                self?.presenter.updateDisplayedModels(response)
            }
        }
    }
}
