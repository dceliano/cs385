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
    mutating func performOp(oper: String){
        // Pushes the result onto the stack, and also returns it to update the display.
        switch oper{
        case "+":
            self.push(self.stack.popLast()! + self.stack.popLast()!) //pop 2 values, and then add them together
            break
        case "-":
            self.push(self.stack.popLast()! - self.stack.popLast()!)
            break
        case "*":
            self.push(self.stack.popLast()! * self.stack.popLast()!)
            break
        case "/":
            self.push(self.stack.popLast()! / self.stack.popLast()!)
            break
        case "sin":
            self.push(sin(self.stack.popLast()!))
            break
        case "cos":
            self.push(cos(self.stack.popLast()!))
            break
        case "tan":
            self.push(tan(self.stack.popLast()!))
            break
            
        default:
            //return the invalidOperator error
            break
        }
    }
    //TO USE: str.characters.contains(".") --handle most of this stuff on the front end (i.e. don't let them put in 2 decimals or something crazy). He shouldn't be able to break it.
    //throw the errors here (i.e. if divided by 0, throw), and then in the controller do{ try... i.e. try op} catch (error){}, and then have a catch{ anything} as a catchall
    
}

var myModel = CalcModel()
var userInput : String?
repeat {
    print("Enter: ",terminator:"")
    userInput = readLine()!
    if let number = Double(userInput!) {
        myModel.push(number)
    } else {
        print(myModel.performOp(userInput!))
    }
    print(myModel)
} while true








