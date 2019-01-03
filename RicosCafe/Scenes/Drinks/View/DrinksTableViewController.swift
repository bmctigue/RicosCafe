//
//  DrinksTableViewController.swift
//  RicosCafe
//
//  Created by Bruce McTigue on 1/2/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import UIKit

class DrinksTableViewController: UIViewController {
    typealias ViewModel = Drinks.ViewModel
    
    static let rowHeight: CGFloat = 74.0
    let cellName = "DrinkCell"
    let cellNibName = "DrinkTableViewCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModels = [ViewModel]()
    var tableViewDatasource: TableViewDataSource<ViewModel>!
    lazy var loadingViewController = LoadingViewController()
    
    private var interactor: InteractorProtocol
    private var presenter: Drinks.Presenter
    
    init(with interactor: InteractorProtocol, presenter: Drinks.Presenter) {
        self.interactor = interactor
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = DrinksTableViewController.rowHeight
        self.tableView.register(UINib(nibName: cellNibName, bundle: nil), forCellReuseIdentifier: cellName)
        
        self.tableViewDatasource = TableViewDataSource(models: viewModels, reuseIdentifier: cellName) { (model: ViewModel, cell: UITableViewCell) in
            let cell = cell as! DrinkTableViewCell
            cell.viewModel = model
        }
        self.tableView.dataSource = tableViewDatasource
        
        let dynamicModels = presenter.dynamicModels
        dynamicModels.addObserver(self) { [weak self] in
            self?.updateTableView(dynamicModels.value)
            self?.loadingViewController.remove()
        }
        
        add(loadingViewController)
        let request = Request()
        interactor.fetchItems(request)
    }
    
    func updateTableView(_ models: [ViewModel]) {
        self.tableViewDatasource.models = models
        self.tableView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
}
