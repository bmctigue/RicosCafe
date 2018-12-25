//
//  DrinksBuilder.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/25/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import Foundation

final class DrinksBuilder: TabBuilder {
    
    private var imageName: String
    
    init(with imageName: String) {
        self.imageName = imageName
    }
    
    func getImageName() -> String {
        return imageName
    }
    
    func run(completionHandler: BuilderBlock) {
        let controller = DrinksViewController()
        completionHandler(controller)
    }
}
