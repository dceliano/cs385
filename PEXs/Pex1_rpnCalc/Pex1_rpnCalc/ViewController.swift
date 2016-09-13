//
//  ViewController.swift
//  Pex1_rpnCalc
//
//  Created by Dom Celiano on 9/8/16.
//  Copyright © 2016 Dom Celiano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myModel = CalcModel()
    var userInput = "" //initialize the input as empty
    @IBOutlet weak var calcDisplay: UILabel!
    @IBOutlet weak var stackDisplay: UILabel!
    
    //these functions will call different parts of my model.
    
    @IBAction func numHit(sender: AnyObject){
        if(userInput.characters.contains(".") && sender.currentTitle!! == "."){
            return //make sure we aren't able to put in 2 decimal places
        }
        else{
            userInput += sender.currentTitle!! //add the string to the value input
            calcDisplay.text = userInput
        }
    }
    @IBAction func enterHit(sender: AnyObject){
        addToStack()
        userInput = ""
        calcDisplay.text = "0"
        calcDisplay.text = userInput
    }
    @IBAction func opHit(sender: AnyObject){
        if(userInput != ""){
            if let number = Double(userInput){ //if there is already a number in the text field, push it onto the stack before doing the operation
                myModel.push(number)
            }
        }
        userInput = sender.currentTitle!!
        addToStack()
        userInput = "" //reset the input
    }
    func addToStack(){
        //if the caller of this function is an operation, we will also push the result onto the stack.
        if let number = Double(userInput) { //if the input is just a number (i.e. we can convert it to a double
                myModel.push(number)
                calcDisplay.text = userInput
        }
        else{ //if it is an operation
            do{
                try myModel.performOp(userInput)
                calcDisplay.text = String(myModel.stack.last!)
            }/*
                    catch divideByZero{
                    calcDisplay.text = "You cannot divide by zero."
                    }
                    catch invalidOperator{
                    calcDisplay.text = "Invalid operator/syntax used."
                    }
                    catch notEnoughOperands{
                    calcDisplay.text = "Not enough operands on the stack."
            }*/
            catch{
                calcDisplay.text = "Unknown error."
            }
        }
        stackDisplay.text = String(myModel.stack)
}
    
    @IBAction func trigFunction(sender:AnyObject){
        do{
            try(myModel.performOp(sender.currentTitle!!))
        }
        catch{ //trig functions should never run into an error.
            calcDisplay.text = "Unknown error."
        }
        stackDisplay.text = String(myModel.stack)
    }
    
    @IBAction func clearHit(sender: AnyObject){
        userInput = ""
        calcDisplay.text = "0"
    }
    @IBAction func negativeHit(sender: AnyObject){
        if(userInput != ""){
            userInput = String(-1*(Double(userInput)!))
            calcDisplay.text = userInput
        }
    }
    @IBAction func backspaceHit(sender: AnyObject){
        if(userInput != ""){
            userInput = String(userInput.characters.dropLast())
            calcDisplay.text = userInput
            if(userInput == ""){
                calcDisplay.text = "0"
            }
        }
    }
    @IBAction func constHit(sender: AnyObject){
        switch sender.currentTitle!!{
        case "pi":
            userInput = String(M_PI)
            enterHit(sender)
            break
        case "e":
            userInput = String(M_E)
            enterHit(sender)
            break
        case "EE":
            break
        default:
            break
        }
        calcDisplay.text = userInput
    }
    @IBAction func sciHit(sender: AnyObject){
        
    }
    @IBAction func allClearHit(sender: AnyObject){
        clearHit(sender)
        myModel.stack.removeAll()
        stackDisplay.text = String(myModel.stack)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

