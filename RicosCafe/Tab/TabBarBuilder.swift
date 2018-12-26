//
//  TabBarBuilder.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 11/28/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit

final class TabBarBuilder: BaseBuilder {
    
    private let tabBarController = UITabBarController()
    private let builders: [TabBuilder]
    private var controllers: [UIViewController] = []
    
    init(with builders: [TabBuilder]) {
        self.builders = builders
    }
    
    func run() {
        for builder in builders {
            addController(builder: builder)
        }
        
        tabBarController.setViewControllers(controllers, animated: false)
        
        for (index, builder) in builders.enumerated() {
            updateTabImage(tab: index, imageName: builder.getImageName())
            updateTabTitle(tab: index, title: builder.getTitle())
        }
    }
    
    private func addController(builder: TabBuilder) {
        builder.run(completionHandler: { controller in
            controllers.append(controller)
        })
    }
    
    private func updateTabImage(tab: Int, imageName: String) {
        self.tabBarController.tabBar.items?[tab].image = UIImage(named: imageName)?.withRenderingMode(.automatic)
        self.tabBarController.tabBar.items?[tab].selectedImage = UIImage(named: imageName)?.withRenderingMode(.automatic)
    }
    
    private func updateTabTitle(tab: Int, title: String) {
        self.tabBarController.tabBar.items?[tab].title = title
    }
}

// for testing
extension TabBarBuilder {
    func getTabBar() -> UITabBarController {
        return tabBarController
    }
    
    func getBuilders() -> [TabBuilder] {
        return builders
    }
}
