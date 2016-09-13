//
//  myModel.swift
//  Pex1_rpnCalc
//
//  Created by T6A User on 9/9/16.
//  Copyright © 2016 Dom Celiano. All rights reserved.
//

/*Documentation: C1C Ryan Doucet showed me I can return an array's last element and remove it at the same time.
 C1C Mitchell Thomas explained to me how the view controller worked in depth and how to explain different functions to connect the funtionality of the different types of buttons to my model.
 */

import Foundation

//3 functions in our model: preform op, push, and pop
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
    mutating func pop() -> Double{
        return stack.removeLast()
    }
    func performOp(oper: String) -> Double{
        // Pushes the result onto the stack, and also returns it to update the display.
        switch oper{
        case "+":
            break
        //pop 2 values, and then add them together
        case "-":
            break
        case "*":
            break
        case "/":
            break
        case "sin":
            break
        case "cos":
            break
        case "tan":
            break
        
        default:
            //return the invalidOperator error
            break
        }
        //push the result onto the stack and return it, if we didn't run into an error
        return 3.0
    }
    
}
/*
var myModel = CalcModel()
var userInput : String?
repeat {
    print("Enter: ",terminator:"")
    userInput = readLine()!
    if let number = Double(userInput!) {
        myModel.push(item: number)
    } else {
        try print(myModel.performOp(oper: userInput!))
    }
    print(myModel)
} while true
*/








