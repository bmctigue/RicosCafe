//
//  TabBarBuilder.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 11/28/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit

extension Builder {
    final class TabBar: TabBarBuilder {
        
        private lazy var tabBarController = UITabBarController()
        private lazy var controllers = [UIViewController]()
        private let builders: [TabBuilder]
        
        init(with builders: [TabBuilder]) {
            self.builders = builders
        }
        
        func run(completionHandler: TabBarBuilderBlock) {
            for builder in builders {
                addController(builder: builder)
            }
            
            tabBarController.setViewControllers(controllers, animated: false)
            
            for (index, builder) in builders.enumerated() {
                updateTabImage(tab: index, imageName: builder.getImageName())
                updateTabTitle(tab: index, title: builder.getTitle())
            }
            
            completionHandler(tabBarController)
        }
        
        private func addController(builder: TabBuilder) {
            builder.run(completionHandler: { controller in
                let navigationController = UINavigationController()
                navigationController.add(controller)
                controller.title = builder.getTitle()
                controllers.append(navigationController)
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
}
