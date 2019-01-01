//
//  Enumerations.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 1/1/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import Foundation

enum StoreError: Error {
    case fetchDataFailed
}

enum Store {
    enum Result {
        case success(Data)
        case error(StoreError)
    }
}

enum DataAdapterError: Error {
    case conversionFailed
}

enum DataAdapter {
    enum Result<Model> {
        case success([Model])
        case error(DataAdapterError)
    }
}
