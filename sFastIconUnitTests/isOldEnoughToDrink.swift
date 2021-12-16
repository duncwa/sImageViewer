//
//  isOldEnoughToDrink.swift
//  sFastIconUnitTests
//
//  Created by Duncan Wallace on 12/15/21.
//  Copyright © 2021 Duncan Wallace. All rights reserved.
//

import XCTest

class isOldEnoughToDrink: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func isOldEnoughToDrink(age: Int) -> Bool {
      // your code here
      /* START SOLUTION */
      var isOldEnough: Bool;
      if (age >= 21) {
        isOldEnough = true;
      } else {
        isOldEnough = false;
      }
      
      return isOldEnough;
    /* END SOLUTION */
    }

    func testIsOldEnoughToDrink() {
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectedBool = true
        XCTAssertEqual(isOldEnoughToDrink(age: 40), expectedBool, " expected bool value")
        XCTAssertEqual(isOldEnoughToDrink(age: 40), true, " should return true")
        XCTAssertEqual(isOldEnoughToDrink(age: 21), true, " should return true")
    }
}
