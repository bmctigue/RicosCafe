//
//  UnboxDataAdapter.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/30/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import Foundation
import Unbox

final class UnboxDataAdapter<Model: Unboxable>: DataAdapter {
    func itemsFromData(_ data: Data) -> [Model] {
        var items = [Model]()
        do {
            items = try unbox(data: data)
        } catch {
            print("data could not be unboxed - \(error.localizedDescription)")
        }
        return items
    }
}
