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
    final class LocalStore: Store {
        func fetchItems<Drink>(completionHandler: @escaping ([Drink]) -> Void) {
            let drinks = drinksFromBundle() as! [Drink]
            completionHandler(drinks)
        }
        
        func drinksFromBundle() -> [Drink] {
            var drinks = [Drink]()
            if let asset = NSDataAsset(name: "drinksJson", bundle: Bundle.main) {
                do {
                    drinks = try unbox(data: asset.data) as [Drink]
                } catch {
                    print("drinks json could not be unboxed - \(error.localizedDescription)")
                }
            } else {
                print("drinks json asset couldn't be loaded")
            }
            return drinks
        }
    }
}
