//
//  isEven.swift
//  BuildingBlocksMastery
//
//  Created by Duncan Wallace on 1/21/20.
//  Copyright © 2020 duncwa LLC. All rights reserved.

//Write a function called “isEven”.
//Given 1 number, “isEven” returns whether num1 is an even number.

import Foundation

func isEven(num1: Int) -> Bool {
  // is the number divisable by 2?
  // number/2 = 0 then true else false
  var isEvenNumber = false
  if (num1 % 2 == 0  || num1 == 0) {
    isEvenNumber = true
  }
  return isEvenNumber
}
