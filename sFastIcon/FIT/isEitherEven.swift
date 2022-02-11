//
//  isEitherEven.swift
//  BuildingBlocksMastery
//
//  Created by Duncan Wallace on 3/1/20.
//  Copyright © 2020 duncwa LLC. All rights reserved.
//

import Foundation

func isEitherEven(numberOne: Int, numberTwo: Int) -> Bool {
    var isEither: Bool = false
    let numberOneEither = numberOne % 2
    let numberTwoEither = numberTwo % 2
    if numberOneEither == 0 || numberTwoEither == 0 {
        isEither = true
    }
    return isEither
}
