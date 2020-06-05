//
//  ListViewController.swift
//  Garment List
//
//  Created by John N on 6/2/20.
//  Copyright © 2020 John Nguyen. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var viewModel: ListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        setupViewModel()
        setupTableView()
    }
    
    func setupViewModel() {
        viewModel = ListViewModel(manager: UserDefaultDataManager())
        viewModel.delegate = self
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
    
    func setupSegmentedControl() {

    }
    
    @IBAction func toggleSegmentedControl(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
          {
          case 0:
            viewModel.sortGarment(byType: .alpha)
          case 1:
            viewModel.sortGarment(byType: .creationTime)
          default:
              break
          }
        
        tableView.reloadData()
    }
    
    
    func setupNavigationController() {
        let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(presentAddViewController))
        rightBarButtonItem.tintColor = UIColor.black
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    @objc func presentAddViewController() {
        let addViewModel = AddViewModel(manager: UserDefaultDataManager())
        let controller = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "addViewController") as! AddViewController
        controller.delegate = self
        controller.configure(addViewModel: addViewModel)
        let navigationViewController = UINavigationController(rootViewController: controller)
        
        present(navigationViewController, animated: true, completion: nil)
    }
}


extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getGarmentCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let garment = viewModel.getGarment(forIndex: indexPath.row)
        let tableViewCell = UITableViewCell()
        tableViewCell.textLabel?.text = garment?.title
        return tableViewCell
    }
}

extension ListViewController: ListViewModelDelegate {
    func handleReloadTableView() {
        tableView.reloadData()
    }
    
    func handleInsertRow(atIndex rowIndex: Int) {
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: rowIndex, section: 0)], with: .automatic)
        tableView.endUpdates()
    }
}

extension ListViewController: AddViewControllerDelegate {
    func handleDidFinishAdd(garment: Garment) {
        viewModel.handleAddGarment(forGarment: garment)
    }
}
