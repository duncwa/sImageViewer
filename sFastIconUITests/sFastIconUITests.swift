//
//  sFastIconUITests.swift
//  sFastIcon
//
//  Created by Jenkins on 10/8/16.
//  Copyright © 2016 Duncan Wallace. All rights reserved.
//

import Foundation
import XCTest

class sFastIconUITests: XCTestCase {
  
    private var app: XCUIApplication {
        return XCUIApplication()
    }
      
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }
      
    override func tearDown() {
        super.tearDown()
    }
    
    func testTableView() {
        app.launch()
        let table = app.tables.element
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: table, handler: nil)
        XCTAssertTrue(table.exists)
        waitForExpectations(timeout: 15, handler: nil)
        let cell = table.cells.element(boundBy: 2)
        XCTAssertTrue(cell.exists)
        let indexedText = cell.staticTexts.element
        XCTAssertTrue(indexedText.exists)
    }
}

// MARK: - Accessibility elements testing

extension XCUIApplication {
  fileprivate var isDisplayingMainView: Bool {
    return otherElements["mainView"].exists
  }
  fileprivate var isDisplayingPhotoCount: Bool {
    return otherElements["photoCount"].exists
  }
}
