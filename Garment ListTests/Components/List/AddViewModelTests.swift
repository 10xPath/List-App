//
//  AddViewModelTests.swift
//  Garment ListTests
//
//  Created by John N on 6/4/20.
//  Copyright © 2020 John Nguyen. All rights reserved.
//

import XCTest
@testable import Garment_List

class AddViewModelTests: XCTestCase {

    func testSaveGarment() {
        let mockDataManager = MockDataManager()
        let garmentOne = Garment(createdDate: Date(), title: "A-1")
        mockDataManager.dataStore = []
        
        let viewModel = AddViewModel(manager: mockDataManager)
        viewModel.saveGarment(forGarment: garmentOne)
        
        let expected = 1
        let actual = mockDataManager.getGarments().count
        
        XCTAssertEqual(expected, actual)
    }
    
}
