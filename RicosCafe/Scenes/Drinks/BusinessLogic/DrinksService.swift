//
//  DrinksService.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/28/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit
import Unbox

extension Drinks {
    final class Service: ServiceProtocol {        
        
        private var store: StoreProtocol
        
        init(_ store: StoreProtocol) {
            self.store = store
        }
        
        func fetchItems(completionHandler: @escaping ([Any]) -> Void) {
            store.fetchData { [weak self] data in
                if let data = data {
                    let items = self?.itemsFromData(data) ?? []
                    completionHandler(items)
                } else {
                    completionHandler([])
                }
            }
        }
        
        func itemsFromData(_ data: Data) -> [Drink] {
            var items = [Drink]()
            do {
                items = try unbox(data: data) as [Drink]
            } catch {
                print("drinks data could not be unboxed - \(error.localizedDescription)")
            }
            return items
        }
    }
}
