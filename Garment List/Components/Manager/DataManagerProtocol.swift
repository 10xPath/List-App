//
//  DataManagerProtocol.swift
//  Garment List
//
//  Created by John N on 6/4/20.
//  Copyright © 2020 John Nguyen. All rights reserved.
//

import Foundation

protocol DataManagerProtocol {
    func getGarments() -> [Garment]
    func saveGarment(forGarment garment: Garment)

}
