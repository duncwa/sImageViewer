//
//  getFullName.swift
//  BuildingBlocksMastery
//
//  Created by Duncan Wallace on 11/29/18.
//  Copyright © 2018 duncwa LLC. All rights reserved.
//
//Write a function called “getFullName”.
//Given a first and a last name, “getFullName” returns a single string with the given first and last names separated by a single space.

import Foundation
//option+backArrow or +forwardArrow
//backslash to escape parens for vars in string
let firstName = "Duncan"
let lastName = "Wallace"
func getFullName(firstName: String, lastName: String) -> String {
  var fullName: String
  fullName = "\(firstName) \(lastName)"
  return fullName
}
