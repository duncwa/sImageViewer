//
//  areBothOdd.swift
//  BuildingBlocksMastery
//
//  Created by Duncan Wallace on 2/22/20.
//  Copyright © 2020 duncwa LLC. All rights reserved.
//

import Foundation

func areBothOdd(numberOne: Int, numberTwo: Int) -> Bool {
    var isOdd: Bool = false
    let numberOneRemainder = numberOne % 2
    let numberTwoRemainder = numberTwo % 2

    if numberOneRemainder == 0 || numberTwoRemainder == 0 {
        isOdd = false
    } else {
        isOdd = true
    }
    return isOdd
}
