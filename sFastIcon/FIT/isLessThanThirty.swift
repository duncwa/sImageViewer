//
//  isLessThanThirty.swift
//  BuildingBlocksMastery
//
//  Created by Duncan Wallace on 12/10/18.
//  Copyright © 2018 duncwa LLC. All rights reserved.
//

// Write a function called “isLessThan30”
// Accepts a value, “isLessThan30” returns whether the
// given value is less than 30

import Foundation

func isLessThanThirty(theNumber: Int) -> Bool {
  var isLess: Bool = false
  if (theNumber < 30) {
    isLess = true
  }
  return isLess
}
