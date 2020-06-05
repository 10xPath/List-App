//
//  AddViewModel.swift
//  Garment List
//
//  Created by John N on 6/2/20.
//  Copyright © 2020 John Nguyen. All rights reserved.
//

import Foundation

class AddViewModel {
    
    var manager: DataManagerProtocol
    
    init(manager: DataManagerProtocol) {
        self.manager = manager
    }
    func saveGarment(forGarment garment: Garment) {
        DataManager(manager: manager).saveGarment(forGarment: garment)
    }
}
