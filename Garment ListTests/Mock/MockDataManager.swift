//
//  MockDataManager.swift
//  Garment ListTests
//
//  Created by John N on 6/4/20.
//  Copyright © 2020 John Nguyen. All rights reserved.
//

import Foundation
@testable import Garment_List

class MockDataManager: DataManagerProtocol {
    
    var dataStore: [Garment] = [] 
    
    func getGarments() -> [Garment] {
        return dataStore
    }
    
    func saveGarment(forGarment garment: Garment) {
        dataStore.append(garment)
    }
}
