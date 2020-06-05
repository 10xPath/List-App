//
//  ListViewModelTests.swift
//  Garment ListTests
//
//  Created by John N on 6/4/20.
//  Copyright © 2020 John Nguyen. All rights reserved.
//

import XCTest
@testable import Garment_List

class ListViewModelTests: XCTestCase {

    func testSortGarmentAlpha() {
        let mockDataManager = MockDataManager()
        let currentDate = Date()
        let aGarment = Garment(createdDate: currentDate, title: "A")
        let bGarment = Garment(createdDate: currentDate, title: "B")
        let cGarment = Garment(createdDate: currentDate, title: "C")
        
        mockDataManager.dataStore = [cGarment,bGarment,aGarment]
        let viewModel = ListViewModel(manager: mockDataManager)
        
        viewModel.sortGarment(byType: .alpha)
        
        let expected = [aGarment,bGarment,cGarment]
        
        XCTAssertEqual(expected[0], viewModel.getGarment(forIndex: 0))
        XCTAssertEqual(expected[1], viewModel.getGarment(forIndex: 1))
        XCTAssertEqual(expected[2], viewModel.getGarment(forIndex: 2))
    }
    
    func testSortGarmentCreateDate() {
        let mockDataManager = MockDataManager()
        let firstDate = Date(timeIntervalSince1970: 1.00)
        let secondDate = Date(timeIntervalSince1970: 2.00)
        let ThirdDate = Date(timeIntervalSince1970: 3.00)
         let firstGarment = Garment(createdDate: firstDate, title: "A-1")
         let secondGarment = Garment(createdDate: secondDate, title: "A-2")
         let thirdGarment = Garment(createdDate: ThirdDate, title: "A-3")
         
         mockDataManager.dataStore = [thirdGarment,secondGarment,firstGarment]
         let viewModel = ListViewModel(manager: mockDataManager)
         
         viewModel.sortGarment(byType: .alpha)
         
         let expected = [firstGarment,secondGarment,thirdGarment]
         
         XCTAssertEqual(expected[0], viewModel.getGarment(forIndex: 0))
         XCTAssertEqual(expected[1], viewModel.getGarment(forIndex: 1))
         XCTAssertEqual(expected[2], viewModel.getGarment(forIndex: 2))
    }
}
