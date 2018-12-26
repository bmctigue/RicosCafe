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
    private var title: String
    
    init(with imageName: String, title: String) {
        self.imageName = imageName
        self.title = title
    }
    
    func getImageName() -> String {
        return imageName
    }
    
    func getTitle() -> String {
        return title
    }
    
    func run(completionHandler: BuilderBlock) {
        let controller = DrinksViewController()
        completionHandler(controller)
    }
}
