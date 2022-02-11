//
//  isGreaterThanTen.swift
//  BuildingBlocksMastery
//
//  Created by Duncan Wallace on 11/29/18.
//  Copyright © 2018 duncwa LLC. All rights reserved.
//

//Write a function called “isGreaterThan10”.
//Given a number, “isGreaterThan10” returns whether the given number is greater than 10.

import Foundation

var isGreater: Bool = false
var theNumber: Double = 27
func isGreaterThanTen(theNumber: Double) -> Bool {
  if (theNumber > 10) {
    isGreater = true
  }
  return isGreater
}
