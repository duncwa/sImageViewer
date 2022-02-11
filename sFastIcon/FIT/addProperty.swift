//
//  addProperty.swift
//  BuildingBlocksMastery
//
//  Created by Duncan Wallace on 10/24/18.
//  Copyright © 2018 duncwa LLC. All rights reserved.
//

//Write a function called “addProperty”.
//Given an object, and a key, “addProperty” sets a new property on the given object with a value of true.

import Foundation

var airportsTestTwo: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dubai", "SFO": "San Francisco", "LAX": "Los Angeles", "DMW": "Duncwa International"];
func addProperty(value: String?) -> String? {
  if let oldValue = airportsTestTwo.updateValue("Duncwa Intergalactic", forKey: value!) {
    return oldValue
  }
  return nil
}
