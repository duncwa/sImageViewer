//
//  isLessThan.swift
//  BuildingBlocksMastery
//
//  Created by Duncan Wallace on 1/20/19.
//  Copyright © 2019 duncwa LLC. All rights reserved.
//

//Write a function called “isLessThan”.
//Given 2 numbers, “isLessThan” returns whether num2 is less than num1.

import Foundation

func isLessThan(numberOne: Double, numberTwo: Double) -> Bool {
  let isLess: Bool = (numberTwo < numberOne) ? true : false
  return isLess
}
