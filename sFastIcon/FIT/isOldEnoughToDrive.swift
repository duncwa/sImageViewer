//
//  isOldEnoughToDrive.swift
//  BuildingBlocksMastery
//
//  Created by Duncan Wallace on 10/6/18.
//  Copyright © 2018 duncwa LLC. All rights reserved.
//

//Write a function called “isOldEnoughToDrive”.
//Given a number, in this case an age, “isOldEnoughToDrive” returns whether a person of this given age is old enough to legally drive in the United States.
//Notes:
//* The legal driving age in the United States is 16.

import Foundation
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
