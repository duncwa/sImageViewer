//
//  sFastIconUnitTests.swift
//  sFastIconUnitTests
//
//  Created by cicdbuild on 8/24/20.
//  Copyright © 2020 Duncan Wallace. All rights reserved.
//

import XCTest

class sFastIconUnitTests: XCTestCase {

    func isOldEnoughToDrive(age: Int) -> Bool {
      // your code here
      /* START SOLUTION */
      var isOldEnough: Bool;
      if (age >= 16) {
        isOldEnough = true;
      } else {
        isOldEnough = false;
      }
      
      return isOldEnough;
      /* END SOLUTION */
    }

    func isOldEnoughToVote(age: Int) -> Bool {
      // your code here
      /* START SOLUTION */
      var isOldEnough: Bool
      if (age >= 18) {
        isOldEnough = true
      } else {
        isOldEnough = false
      }
      return isOldEnough
    }
    
    func isOldEnoughToDrinkAndDrive(age: Int) -> Bool {
      // it is illegal, regardless of age, to drink and drive
      return false;
    }
    
    var airportsTestOne: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dubai", "SFO": "San Francisco", "LAX": "Los Angeles", "DMW": "Duncwa International"];
    func getProperty(value: String?) -> String? {
      if let airportName = airportsTestOne[value!] {
        return airportName
      } else {
        return nil
      }
    }
    
    func testIsOldEnoughToDrive() {
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectedBool = false
        XCTAssertEqual(isOldEnoughToDrive(age: 11), expectedBool, " expected bool value")
        XCTAssertEqual(isOldEnoughToDrive(age: 40), true, " should return true")
        XCTAssertEqual(isOldEnoughToDrive(age: 16), true, " should return true")
    }
    
    func testIsOldEnoughToVote() {
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectedBool = true
        XCTAssertEqual(isOldEnoughToVote(age: 40), expectedBool, " expected bool value" )
        XCTAssertEqual(isOldEnoughToVote(age: 40), true, " should return true if age is greater than 18 ")
        XCTAssertEqual(isOldEnoughToVote(age: 18), true, " should return true if age is 18" )
    }
    
    func testIsOldEnoughToDrinkAndDrive() {
        let expectedBool = false
        XCTAssertEqual(isOldEnoughToDrinkAndDrive(age: 21), expectedBool, " expected bool value")
        XCTAssertEqual(isOldEnoughToDrinkAndDrive(age: 9999999), false, " should return false with any age ")
        XCTAssertEqual(isOldEnoughToDrinkAndDrive(age: -9999999), false, " should return false with any age ")
    }

    func testGetProperty() {
      let expected: String = "Dubai"
      XCTAssertEqual(getProperty(value: "DUB"), expected, "Expected DUB to equal Dubai")
      XCTAssertEqual(getProperty(value: "MMM"), nil, "Expected MMM to equal nil")
    }
}
