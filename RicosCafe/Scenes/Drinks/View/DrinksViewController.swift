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
        
        private var tableViewController: DrinksTableViewController
        
        init(with tableViewController: DrinksTableViewController) {
            self.tableViewController = tableViewController
            super.init(nibName: nil, bundle: nil)
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.view.backgroundColor = UIColor.lightGray
            add(tableViewController)
        }
        
        required init?(coder aDecoder: NSCoder) {
            return nil
        }
    }
}
