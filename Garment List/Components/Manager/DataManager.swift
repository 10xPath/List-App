//
//  DataManager.swift
//  Garment List
//
//  Created by John N on 6/4/20.
//  Copyright © 2020 John Nguyen. All rights reserved.
//

import Foundation


class DataManager : DataManagerProtocol{
    
    var manager: DataManagerProtocol
    
    init(manager: DataManagerProtocol) {
        self.manager = manager
    }
    
    func getGarments() -> [Garment] {
        return manager.getGarments()
    }
    
    func saveGarment(forGarment garment: Garment) {
        manager.saveGarment(forGarment: garment)
    }
}
