//
//  DrinksLocalStore.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/27/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit

extension Drinks {
    final class LocalStore: StoreProtocol {
        
        private var assetName: String
        
        init(_ assetName: String) {
            self.assetName = assetName
        }
        
        func fetchData(completionHandler: @escaping (Data?) -> Void) {
            if let asset = NSDataAsset(name: assetName, bundle: Bundle.main) {
                completionHandler(asset.data)
            } else {
                print("drinks json asset couldn't be loaded")
                completionHandler(nil)
            }
        }
    }
}
