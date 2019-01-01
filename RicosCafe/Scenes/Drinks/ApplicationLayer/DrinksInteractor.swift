//
//  DrinksInteractor.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/27/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import Foundation

extension Drinks {
    final class Interactor: InteractorProtocol {
        
        private var service: ServiceProtocol
        private var viewModel: Drinks.ViewModel
        private var presenter: Drinks.Presenter
        
        init(_ service: ServiceProtocol, viewModel: Drinks.ViewModel, presenter: Drinks.Presenter) {
            self.service = service
            self.viewModel = viewModel
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
