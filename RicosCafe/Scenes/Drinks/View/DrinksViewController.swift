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
        private var viewModel: Drinks.ViewModel
        
        init(with interactor: InteractorProtocol, viewModel: Drinks.ViewModel) {
            self.interactor = interactor
            self.viewModel = viewModel
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.view.backgroundColor = UIColor.lightGray
            
            let dynamicDrinks = viewModel.dynamicDrinks
            dynamicDrinks.addObserver(self) {
                print(dynamicDrinks.value)
            }
            
            interactor.fetchItems()
        }

    }
}
