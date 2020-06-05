//
//  AddViewController.swift
//  Garment List
//
//  Created by John N on 6/2/20.
//  Copyright © 2020 John Nguyen. All rights reserved.
//

import UIKit

protocol AddViewControllerDelegate: class {
    func handleDidFinishAdd(garment: Garment)
}

class AddViewController: UIViewController {
    
    private var viewModel: AddViewModel!
    weak var delegate: AddViewControllerDelegate?
    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationView()
    }
    
    func configure(addViewModel: AddViewModel) {
        self.viewModel = addViewModel
    }
    
    func setupNavigationView() {
        setupNavigationTitle()
        setupRightNavButton()
    }
    
    func setupNavigationTitle() {
        navigationItem.title = "ADD"
    }
    
    func setupRightNavButton() {
        let saveBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(clickSave))
        navigationItem.rightBarButtonItem = saveBarButtonItem
    }
    
    @objc func clickSave() {
        self.dismiss(animated: true) {
            let garmentToBeSaved = Garment(createdDate: Date(), title: self.titleTextField.text)
            self.viewModel.saveGarment(forGarment: garmentToBeSaved)
            self.delegate?.handleDidFinishAdd(garment: garmentToBeSaved)
        }
    }
}
