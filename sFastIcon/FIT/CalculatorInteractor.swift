//
//  CalculatorInteractor.swift
//  BuildingBlocksMastery
//
//  Created by Duncan Wallace on 10/10/20.
//  Copyright © 2020 duncwa LLC. All rights reserved.
//

import Foundation
 
class CalculatorInteractor {
    func add(numberOne: Float, to numberTwo: Float) -> Float {
        return numberOne + numberTwo
    }
     
    func subtract(numberOne: Float, from numberTwo: Float) -> Float {
        return numberTwo - numberOne
    }
     
    func multiply(numberOne: Float, by numberTwo: Float) -> Float {
        return numberOne * numberTwo
    }
     
    func divide(numberOne: Float, by numberTwo: Float) -> Float {
        return numberOne / numberTwo
    }
}
