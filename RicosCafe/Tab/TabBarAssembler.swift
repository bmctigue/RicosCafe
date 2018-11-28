//
//  TabBarAssembler.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 11/28/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit

final class TabBarAssembler: BaseAssembler {
    
    private let tabBarController = UITabBarController()
    private let assemblers: [TabAssembler]
    private var controllers: [UIViewController] = []
    
    init(with assemblers: [TabAssembler]) {
        self.assemblers = assemblers
    }
    
    func run() {
        for assembler in assemblers {
            addController(assembler: assembler)
        }
        
        tabBarController.setViewControllers(controllers, animated: false)
        
        for (index, assembler) in assemblers.enumerated() {
            updateTabImage(tab: index, imageName: assembler.getImageName())
        }
    }
    
    private func addController(assembler: TabAssembler) {
        assembler.run(completionHandler: { controller in
            controllers.append(controller)
        })
    }
    
    private func updateTabImage(tab: Int, imageName: String) {
        self.tabBarController.tabBar.items?[tab].image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        self.tabBarController.tabBar.items?[tab].selectedImage = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
    }
}

// for testing
extension TabBarAssembler {
    func getTabBar() -> UITabBarController {
        return tabBarController
    }
    
    func getAssemblers() -> [TabAssembler] {
        return assemblers
    }
}
