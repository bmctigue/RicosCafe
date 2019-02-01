//
//  UnboxDataAdapter.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/30/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import Foundation
import Unbox
import Promis
import Tiguer

struct UnboxDataAdapter<Model: Unboxable>: DataAdapterProtocol {
    typealias Model = Product
    func itemsFromData(_ data: Data) -> Future<DataAdapter.Result<Model>> {
        let promise = Promise<DataAdapter.Result<Model>>()
        do {
            let items: [Product] = try unbox(data: data)
            promise.setResult(.success(items))
        } catch {
            promise.setError(DataAdapterError.conversionFailed)
        }
        return promise.future
    }
}
