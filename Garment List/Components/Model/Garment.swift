//
//  Garment.swift
//  Garment List
//
//  Created by John N on 6/3/20.
//  Copyright © 2020 John Nguyen. All rights reserved.
//

import Foundation


struct Garment: Codable, Equatable {
    let createdDate: Date!
    let title: String!
    
    static func ==(lhs: Garment, rhs: Garment) -> Bool {
        return lhs.title == rhs.title && lhs.createdDate == rhs.createdDate
    }
}
