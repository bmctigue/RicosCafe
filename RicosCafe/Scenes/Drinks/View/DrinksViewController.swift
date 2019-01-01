//
//  DrinksViewController.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/25/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit

extension Drinks {
    final class ViewController: UIViewController {
        
        private var interactor: InteractorProtocol
        private var presenter: Drinks.Presenter
        
        init(with interactor: InteractorProtocol, presenter: Drinks.Presenter) {
            self.interactor = interactor
            self.presenter = presenter
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.view.backgroundColor = UIColor.lightGray
            
            let dynamicModels = presenter.dynamicModels
            dynamicModels.addObserver(self) {
                print(dynamicModels.value)
            }
            
            let request = Request()
            interactor.fetchItems(request)
        }

    }
}
