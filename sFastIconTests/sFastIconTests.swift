//
//  sFastIconTests.swift
//  sFastIcon
//
//  Created by Jenkins on 10/8/16.
//  Copyright © 2016 Duncan Wallace. All rights reserved.
//

import XCTest

class sFastIconTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
        // Put the code you want to measure the time of here.
        func countUp() {
           DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            // Get data from file/network/other in background
            var arrTest = [0]
            for index in 0...1000 {
                arrTest.append(index)
            }
           }
         }
        }
    }
    
}
