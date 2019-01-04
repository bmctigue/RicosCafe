//
//  ProductsViewController.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 12/25/18.
//  Copyright © 2018 tiguer. All rights reserved.
//

import UIKit

final class ProductsViewController: UIViewController {
    
    private var tableViewController: ProductsTableViewController
    
    init(with tableViewController: ProductsTableViewController) {
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
