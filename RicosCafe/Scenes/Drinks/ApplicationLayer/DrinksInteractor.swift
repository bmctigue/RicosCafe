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
        
        init(_ service: ServiceProtocol, viewModel: Drinks.ViewModel) {
            self.service = service
            self.viewModel = viewModel
        }
        
        func fetchItems() {
            service.fetchItems { [weak self] drinks in
                self?.viewModel.updateDisplayedDrinks(drinks as! [Drink])
            }
        }
    }
}
