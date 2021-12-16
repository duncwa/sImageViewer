//
//  isSameLength.swift
//  BuildingBlocksMastery
//
//  Created by Duncan Wallace on 2/16/20.
//  Copyright © 2020 duncwa LLC. All rights reserved.
//

import Foundation

func isSameLength(word1: String, word2: String) -> Bool {
    var isSame: Bool
    if word1.count == word2.count {
        isSame = true
    } else {
        isSame = false
    }
    return isSame
}
