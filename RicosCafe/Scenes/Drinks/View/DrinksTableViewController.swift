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
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModels = [ViewModel]()
    var tableViewDatasource: TableViewDataSource<ViewModel>!
    
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
        self.tableViewDatasource = TableViewDataSource(models: viewModels, reuseIdentifier: "Cell") { (model: ViewModel, cell: UITableViewCell) in
            cell.textLabel?.text = model.name
            cell.detailTextLabel?.text = model.text
        }
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = tableViewDatasource
        
        let dynamicModels = presenter.dynamicModels
        dynamicModels.addObserver(self) { [weak self] in
            print(dynamicModels.value)
            self?.updateTableView(dynamicModels.value)
        }
        
        let request = Request()
        interactor.fetchItems(request)
    }
    
    func updateTableView(_ models: [ViewModel]) {
        self.tableViewDatasource.models = models
        self.tableView.reloadData()
    }
}
