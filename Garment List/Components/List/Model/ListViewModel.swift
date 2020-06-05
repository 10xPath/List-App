//
//  ListViewModel.swift
//  Garment List
//
//  Created by John N on 6/2/20.
//  Copyright © 2020 John Nguyen. All rights reserved.
//

import Foundation

enum SortType {
    case alpha
    case creationTime
}

protocol ListViewModelDelegate: class {
    func handleInsertRow(atIndex: Int)
    func handleReloadTableView()
}

class ListViewModel {
    private var garments:[Garment]?
    weak var delegate:ListViewModelDelegate?
    var sortState: SortType = .alpha
    var manager: DataManagerProtocol!
    
    init(manager: DataManagerProtocol) {
        self.manager = manager
        handleLoadGarments()
    }
    
    private func handleLoadGarments() {
        loadGarments()
        delegate?.handleReloadTableView()
    }
    
    private func loadGarments() {
        garments = DataManager(manager: manager).getGarments()
    }
    
    public func getSortState() -> SortType{
        return sortState
    }
    
    public func getGarmentCount() -> Int {
        return garments?.count ?? 0
    }
    

    public func getGarment(forIndex index: Int) -> Garment? {
        return garments?[index]
    }
    
    public func sortGarment(byType sortType: SortType) {
        switch sortType {
        case .alpha:
            garments?.sort(by: {$0.title < $1.title})
        case .creationTime:
            garments?.sort(by: {$0.createdDate < $1.createdDate})
        }
    }
    
    public func handleAddGarment(forGarment garment: Garment) {
        var insertionIndex = garments?.count
        switch sortState {
        case .alpha:
            insertionIndex = garments?.sortedInsertionIndex(garment, isOrderedBefore: {$0.title < $1.title})
        case .creationTime:
            insertionIndex = garments?.sortedInsertionIndex(garment, isOrderedBefore: {$0.createdDate < $1.createdDate})
        }
        garments?.insert(garment, at: insertionIndex ?? 0)
        delegate?.handleInsertRow(atIndex: insertionIndex ?? 0)
    }
    
}
