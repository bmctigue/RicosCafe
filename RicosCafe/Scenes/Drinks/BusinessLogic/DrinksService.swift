//
//  DrinksService.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/28/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit

extension Drinks {
    final class Service<Adapter: DataAdapter>: ServiceProtocol {
        
        private var store: StoreProtocol
        private var dataAdapter: Adapter
        
        init(_ store: StoreProtocol, dataAdapter: Adapter) {
            self.store = store
            self.dataAdapter = dataAdapter
        }
        
        func fetchItems(completionHandler: @escaping ([Any]) -> Void) {
            store.fetchData { [weak self] result in
                switch(result) {
                    case .success(let data):
                        let items = self?.dataAdapter.itemsFromData(data) ?? []
                        completionHandler(items)
                    case .error(let error):
                        print("drinks error: \(error.localizedDescription)")
                        completionHandler([])
                }
            }
        }
    }
}
