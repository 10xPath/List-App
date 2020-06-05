//
//  DataManager.swift
//  Garment List
//
//  Created by John N on 6/4/20.
//  Copyright © 2020 John Nguyen. All rights reserved.
//

import Foundation

class UserDefaultDataManager: DataManagerProtocol {
    
    func getGarments() -> [Garment] {
        if let data = UserDefaults.standard.value(forKey: "garment-production") as? Data {
             let retrievedGarments = try? PropertyListDecoder().decode([Garment].self, from: data)
             return retrievedGarments ?? [] 
         }
        return []
    }
    
    func saveGarment(forGarment garment: Garment) {
        var garments = getGarments()
        let userDefault = UserDefaults.standard
        garments.append(garment)
        userDefault.set(try? PropertyListEncoder().encode(garments), forKey: "garment-production")
    }
}
