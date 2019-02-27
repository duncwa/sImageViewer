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
    
    func testExample() {
      app.launch()
      
      //let firstItem = self.app.staticTexts["accusamus beatae ad facilis cum similique qui sunt"]
      //let firstItem = self.app.staticTexts["accusam..."]
      let firstItem = self.app.staticTexts["0"]


      let exists = NSPredicate(format: "exists == true")
      expectation(for: exists, evaluatedWith: firstItem, handler: nil)
      
      waitForExpectations(timeout: 15, handler: nil)
      XCTAssertTrue(app.isDisplayingMainView)
      snapshot("Launch sFastIcon Display")
      
      XCTAssertTrue(app.isDisplayingPhotoCount)
      snapshot("PhotoCount sFastIcon Display")
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
