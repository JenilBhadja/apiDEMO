//
//  ArithmeticOperators.swift
//  hygym
//
//  Created by HK on 14/10/22.
//

import Foundation

//protocol Arithmetic{
//    func greaterThanEqual(a: Self, b: Self) -> Bool
//    func lestThanEqual(a: Self, b: Self) -> Bool
//}

//extension Int: Arithmetic {}
//extension Double: Arithmetic {}
//extension Float: Arithmetic {}


class Expr {
    let operand1: Float
    let operand2: Float
    let arithmeticOperator: String
    
    init(a operandA: Float, b operandB: Float, o arithmeticOperator: String) {
        operand1 = operandA
        operand2 = operandB
        self.arithmeticOperator = arithmeticOperator
    }
    
    func calculate() -> Bool {
        switch arithmeticOperator{
        case ">=":
            let val = operand1 >= operand2
            return val
        case "<=":
            let val = operand1 <= operand2
            return val
        case "<":
            let val = operand1 < operand2
            return val
        case ">":
            let val = operand1 > operand2
            return val
        case "=":
            let val = operand1 == operand2
            return val
        default:
            return false
        }
    }
}
