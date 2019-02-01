//
//  Protocols.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/26/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit
import Tiguer

typealias TabBarBuilderBlock = ((UITabBarController) -> Void)

protocol TabBarBuilder: class {
    func run(completionHandler: TabBarBuilderBlock)
}

protocol TabBuilder: VCBuilder {
    func getImageName() -> String
    func getTitle() -> String
}

protocol ColorTheme {
    func primaryColor() -> UIColor
    func secondaryColor() -> UIColor
}
