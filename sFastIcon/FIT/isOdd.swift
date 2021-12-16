//
//  isOdd.swift
//  BuildingBlocksMastery
//
//  Created by Duncan Wallace on 1/21/20.
//  Copyright © 2020 duncwa LLC. All rights reserved.
//

import Foundation

func isOdd(num1: Int) -> Bool {
    
    // is number odd
    // number is odd if number / 2 is not 0
    var isOddNumber = false
    if (num1 % 2 != 0) {
        isOddNumber = true
    }
    return isOddNumber
}
