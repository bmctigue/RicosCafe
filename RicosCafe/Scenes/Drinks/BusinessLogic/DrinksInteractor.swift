//
//  DrinksInteractor.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/27/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import Foundation

extension Drinks {
    final class Interactor<S: StoreProtocol>: InteractorProtocol {
        
        private var store: S
        private var viewModel: Drinks.ViewModel
        
        init(_ store: S, viewModel: Drinks.ViewModel) {
            self.store = store
            self.viewModel = viewModel
        }
        
        func fetchItems() {
            store.fetchItems { [weak self] (drinks: [Drink]) in
                self?.viewModel.updateDisplayedDrinks(drinks)
            }
        }
    }
}
