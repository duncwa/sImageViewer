//
//  removeProperty.swift
//  BuildingBlocksMastery
//
//  Created by Duncan Wallace on 11/4/18.
//  Copyright © 2018 duncwa LLC. All rights reserved.
//

//Write a function called “removeProperty”.
//Given an object and a key, “removeProperty” removes the given key from the given object.

import Foundation
var airportsTestThree: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dubai", "SFO": "San Francisco", "LAX": "Los Angeles", "DMW": "Duncwa International"];
func removeProperty(value: String) -> String? {
  airportsTestThree.removeValue(forKey: value)
  if let _ = airportsTestThree[value] {
    return airportsTestThree[value]
  } else {
    return "Removed \(value)"
  }
}


