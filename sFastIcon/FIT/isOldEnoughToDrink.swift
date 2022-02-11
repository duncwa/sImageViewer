//
//  isOldEnoughToDrive.swift
//  BuildingBlocksMastery
//
//  Created by Duncan Wallace on 10/6/18.
//  Copyright © 2018 duncwa LLC. All rights reserved.
//
//Write a function called “isOldEnoughToDrink”.
//Given a number, in this case an age, “isOldEnoughToDrink” returns whether a person of this given age is old enough to legally drink in the United States.
//Notes:
//* The legal drinking age in the United States is 21.
import Foundation

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
