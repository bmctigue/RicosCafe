//
//  Assembler.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 11/28/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit

typealias AssemblerBlock = ((UIViewController) -> Void)

protocol BaseAssembler: class {
    func run()
}

protocol Assembler: class {
    func run(completionHandler: AssemblerBlock)
}

protocol TabAssembler: class {
    func getImageName() -> String
    func run(completionHandler: AssemblerBlock)
}
