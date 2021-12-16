//
//  checkAge.swift
//  BuildingBlocksMastery
//
//  Created by Duncan Wallace on 11/28/18.
//  Copyright © 2018 duncwa LLC. All rights reserved.
//

//Write a function called “checkAge”.
//Given a person’s name and age, “checkAge” returns one of two messages:
//“Go home, {insert_name_here}!”, if they are younger than 21.
//“Welcome, {insert_name_here}!”, if they are 21 or older.
//Naturally, replace “{insert_name_here}” with the given name. :)

import Foundation
let name = "Duncan"
let age = "59"
func checkAge(name: String, age: Int) -> String {
  var greeting = " "
  if (age < 21) {
    greeting = "Go home, \(name)!"
  } else {
    greeting = "Welcome, \(name)!"
  }
  return greeting
}


