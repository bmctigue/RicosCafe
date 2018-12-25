//
//  Builder.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 11/28/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit

typealias BuilderBlock = ((UIViewController) -> Void)

protocol BaseBuilder: class {
    func run()
}

protocol Builder: class {
    func run(completionHandler: BuilderBlock)
}

protocol TabBuilder: Builder {
    func getImageName() -> String
}
