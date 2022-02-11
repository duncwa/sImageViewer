//
//  getLengthOfWord.swift
//  BuildingBlocksMastery
//
//  Created by Duncan Wallace on 11/29/18.
//  Copyright © 2018 duncwa LLC. All rights reserved.
//

//Write a function called “getLengthOfWord”.
//Given a word, “getLengthOfWord” returns the length of the given word.

import Foundation
var word: String = "supercalifragilisticexpeyallodocious"
func getLengthOfWord(word: String) -> Int {
  var length: Int = 0
  for _ in word {
    length += 1
  }
  return length
}
