//
//  isOldEnoughToVote.swift
//  BuildingBlocksMastery
//
//  Created by Duncan Wallace on 10/7/18.
//  Copyright © 2018 duncwa LLC. All rights reserved.
//

//Write a function called “isOldEnoughToVote”.
//Given a number, in this case an age, ‘isOldEnoughToVote’ returns whether a person of this given age is old enough to legally vote in the United States.
//Notes:
//* The legal voting age in the United States is 18.

import Foundation
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
