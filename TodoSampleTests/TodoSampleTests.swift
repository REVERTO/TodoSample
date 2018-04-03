//
//  TodoSampleTests.swift
//  TodoSampleTests
//
//  Created by Tomoyuki Ito on 2018/04/03.
//  Copyright © 2018 Tomoyuki Ito. All rights reserved.
//

import XCTest
@testable import TodoSample

class TodoSampleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let dataStore = DataStore()
        
        XCTAssert(dataStore.itemsCount() == 0)
        XCTAssert(dataStore.item(index: 0) == nil)
        dataStore.insertItem(text: "hello")
        XCTAssert(dataStore.itemsCount() == 1)
        XCTAssert(dataStore.item(index: 0) == "hello")
    }
    
}
