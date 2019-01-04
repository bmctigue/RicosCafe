//
//  ProductsLocalStore.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/27/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit

struct LocalStore: StoreProtocol {
    
    private var assetName: String
    
    init(_ assetName: String) {
        self.assetName = assetName
    }
    
    func fetchData(_ request: Request, completionHandler: @escaping (Store.Result) -> Void) {
        if let asset = NSDataAsset(name: assetName, bundle: Bundle.main) {
            completionHandler(.success(asset.data))
        } else {
            completionHandler(.error(StoreError.fetchDataFailed))
        }
    }
}
