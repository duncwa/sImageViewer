//
//  getProperty.swift
//  BuildingBlocksMastery
//
//  Created by Duncan Wallace on 10/24/18.
//  Copyright © 2018 duncwa LLC. All rights reserved.
//
//
//Write a function called “getProperty”.
//Given an object and a key, “getProperty” returns the value of the property at the given key.
//Notes:
//* If there is no property at the given key, it should return undefined.

import Foundation
// return the value for a given key
// return nil if no value present at key
var airportsTestOne: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dubai", "SFO": "San Francisco", "LAX": "Los Angeles", "DMW": "Duncwa International"];
func getProperty(value: String?) -> String? {
  if let airportName = airportsTestOne[value!] {
    return airportName
  } else {
    return nil
  }
}


