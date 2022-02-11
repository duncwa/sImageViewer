//
//  getLengthOfTwoWords.swift
//  BuildingBlocksMastery
//
//  Created by Duncan Wallace on 11/29/18.
//  Copyright © 2018 duncwa LLC. All rights reserved.
//
//
//Write a function called “getLengthOfTwoWords”.
//Given 2 words, “getLengthOfTwoWords” returns the sum of their lengths.

import Foundation

var totalLength: Int = 0
let wordOne = "exiguous"
let wordTwo = "ingenuous"
func getLengthOfTwoWords(wordOne: String, wordTwo: String) -> Int {
  var length: Int = 0
  func countCharacters(someWord: String) -> Int {
    length = 0
    for _ in someWord {
      length += 1
    }
    return length
  }
  return countCharacters(someWord: wordOne) +  countCharacters(someWord: wordTwo)
}
