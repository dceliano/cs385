//
//  myModel.swift
//  Pex1_rpnCalc
//
//  Created by T6A User on 9/9/16.
//  Copyright © 2016 Dom Celiano. All rights reserved.
//

//KEEP OLD DOCUMENTATION UP HERE.

import Foundation

//when you do a 5+ for example, it does push and then 2 pops - you don't have to specify the push
//use "%1.2f" when displaying decimals

struct CalcModel {
    
    //catching errors
    enum calcError : ErrorType {
        case divideByZero
        case notEnoughOperands
        case invalidOperator
    }
    var stack = [Double]()
    
    mutating func push(item: Double){
        self.stack.append(item)
    }
    mutating func performOp(oper: String) throws{
        // Pushes the result onto the stack, and also returns it to update the display.
        switch oper{
        case "+":
            if(self.stack.count < 2){
                throw calcError.notEnoughOperands
            }
            else{
                self.push(self.stack.popLast()! + self.stack.popLast()!) //pop 2 values, and then add them together
            }
            break
        case "-":
            if(self.stack.count < 2){
                throw calcError.notEnoughOperands
            }
            else{
                self.push(-(self.stack.popLast()! - self.stack.popLast()!)) //pop 2 values, and then add them together
            }
            break
        case "*":
            if(self.stack.count < 2){
                throw calcError.notEnoughOperands
            }
            else{
                self.push(self.stack.popLast()! * self.stack.popLast()!) //pop 2 values, and then add them together
            }
            break
        case "/":
            if(self.stack.count < 2){
                throw calcError.notEnoughOperands
            }
            else{
                let denominator = self.stack.popLast()! //hold these values in temporary values so we can do error checking
                let numerator = self.stack.popLast()!
                if(denominator == 0){
                    throw calcError.divideByZero
                }
                else{
                    self.push(numerator / denominator) //pop 2 values, and then add them together
                }
            }
            break
        case "sin":
            if(self.stack.count < 1){
                throw calcError.notEnoughOperands
            }
            else{
                self.push(Double(sin(self.stack.popLast()!)))
            }
            break
        case "cos":
            if(self.stack.count < 1){
                throw calcError.notEnoughOperands
            }
            else{
                self.push(Double(cos(self.stack.popLast()!)))
            }
            break
        case "tan":
            if(self.stack.count < 1){
                throw calcError.notEnoughOperands
            }
            else{
                self.push(Double(tan(self.stack.popLast()!)))
            }
            break
            
        default:
            throw calcError.invalidOperator //something weird happened, so just return the invalid operator error.
        }
    }
}

var myModel = CalcModel()
var userInput : String?
repeat {
    print("Enter: ",terminator:"")
    userInput = readLine()!
    if let number = Double(userInput!) {
        myModel.push(number)
    } else {
        try print(myModel.performOp(userInput!))
    }
    print(myModel)
} while true








