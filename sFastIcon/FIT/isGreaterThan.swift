//
//  isGreaterThan.swift
//  BuildingBlocksMastery
//
//  Created by Duncan Wallace on 1/24/19.
//  Copyright © 2019 duncwa LLC. All rights reserved.
//

//Write a function called “isGreaterThan”.
//Given 2 numbers, “isGreaterThan” returns whether num2 is greater than num1.

import Foundation

func isGreaterThan(num1: Double, num2: Double) -> Bool {
  var isGreater = false
  if (num2 > num1) {
    isGreater = true
  }
  return isGreater
}
