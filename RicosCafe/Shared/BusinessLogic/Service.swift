//
//  DrinksService.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/28/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit

final class Service<Adapter: DataAdapterProtocol>: ServiceProtocol {
    
    typealias Model = Any
    
    private var store: StoreProtocol
    private var dataAdapter: Adapter
    
    init(_ store: StoreProtocol, dataAdapter: Adapter) {
        self.store = store
        self.dataAdapter = dataAdapter
    }
    
    func fetchItems(_ request: Request, completionHandler: @escaping ([Model]) -> Void) {
        store.fetchData(request) { [weak self] result in
            switch(result) {
                case .success(let data):
                    self?.itemsFromData(data: data, completionHandler: completionHandler)
                case .error(let error):
                    print("drinks error: \(error.localizedDescription)")
                    completionHandler([])
            }
        }
    }
    
    private func itemsFromData(data: Data, completionHandler: @escaping ([Model]) -> Void) {
        self.dataAdapter.itemsFromData(data) { adapterResult in
            switch(adapterResult) {
            case .success(let items):
                completionHandler(items)
            case .error(let error):
                print("conversion error for data: \(error.localizedDescription)")
                completionHandler([])
            }
        }
    }
}
