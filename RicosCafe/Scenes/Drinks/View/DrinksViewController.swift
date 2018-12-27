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
        
        lazy var viewModel = Drinks.ViewModel()

        override func viewDidLoad() {
            super.viewDidLoad()
            self.view.backgroundColor = UIColor.lightGray
        }

    }
}
