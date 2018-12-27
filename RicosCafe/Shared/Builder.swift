//
//  Builder.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 11/28/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit

typealias VCBuilderBlock = ((UIViewController) -> Void)

protocol BaseBuilder: class {
    func run()
}

protocol VCBuilder: class {
    func run(completionHandler: VCBuilderBlock)
}

protocol TabBuilder: VCBuilder {
    func getImageName() -> String
    func getTitle() -> String
}
