//
//  myModel.swift
//  Pex1_rpnCalc
//
//  Created by T6A User on 9/9/16.
//  Copyright © 2016 Dom Celiano. All rights reserved.
//

/*Documentation: C1C Ryan Doucet showed me I can return an array's last element and remove it at the same time.
 C1C Mitchell Thomas explained to me how the view controller worked in depth and how to explain different functions to connect the funtionality of the different types of buttons to my model. He also helped explain to me how throwing errors works, and fixing some SigABT errors I was getting.
 */

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
                self.push(sin(self.stack.popLast()!))
            }
            break
        case "cos":
            if(self.stack.count < 1){
                throw calcError.notEnoughOperands
            }
            else{
                self.push(cos(self.stack.popLast()!))
            }
            break
        case "tan":
            if(self.stack.count < 1){
                throw calcError.notEnoughOperands
            }
            else{
                self.push(tan(self.stack.popLast()!))
            }
            break
            
        default:
            throw calcError.invalidOperator //something weird happened, so just return the invalid operator error.
        }
    }
    //TO USE: str.characters.contains(".") --handle most of this stuff on the front end (i.e. don't let them put in 2 decimals or something crazy). He shouldn't be able to break it.
    //throw the errors here (i.e. if divided by 0, throw), and then in the controller do{ try... i.e. try op} catch (error){}, and then have a catch{ anything} as a catchall
    
}






