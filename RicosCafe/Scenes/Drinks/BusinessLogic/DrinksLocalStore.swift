//
//  DrinksLocalStore.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/27/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit
import Unbox

extension Drinks {
    final class LocalStore: Local {
        typealias T = Drink
        
        func fetchItems<T>(completionHandler: @escaping ([T]) -> Void) {
            let items = itemsFromBundle("drinksJson") as! [T]
            completionHandler(items)
        }
        
        func itemsFromBundle(_ assetName: String) -> [T] {
            var items = [T]()
            if let asset = NSDataAsset(name: assetName, bundle: Bundle.main) {
                do {
                    items = try unbox(data: asset.data) as [T]
                } catch {
                    print("items json could not be unboxed - \(error.localizedDescription)")
                }
            } else {
                print("items json asset couldn't be loaded")
            }
            return items
        }
    }
}
