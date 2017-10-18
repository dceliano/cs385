//
//  ViewController.swift
//  Pex1_rpnCalc
//
//  Created by Dom Celiano on 9/8/16.
//  Copyright © 2016 Dom Celiano. All rights reserved.
//
/*Documentation: C1C Ryan Doucet showed me I can return an array's last element and remove it at the same time.
 C1C Mitchell Thomas explained to me how the view controller worked in depth and how to explain different functions to connect the funtionality of the different types of buttons to my model. He also helped explain to me how throwing errors works, and fixing some SigABT errors I was getting.
 */

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
            }/* //would have finished this/got it working exactly correct if more time.
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
                calcDisplay.text = "Error!"
            }
        }
        stackDisplay.text = String(myModel.stack)
}
    
    @IBAction func trigFunction(sender:AnyObject){
        calcDisplay.text = "0"
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
            calcDisplay.text = userInput
            break
        case "e":
            userInput = String(M_E)
            enterHit(sender)
            calcDisplay.text = userInput
            break
        case "EE":
            //got the code below from http://stackoverflow.com/questions/31934088/convert-double-to-scientific-notation-in-swift
            let numberFormatter = NSNumberFormatter()
            numberFormatter.numberStyle = NSNumberFormatterStyle.ScientificStyle
            numberFormatter.positiveFormat = "0.###E+0"
            numberFormatter.exponentSymbol = "e"
            
            if let stringFromNumber = numberFormatter.stringFromNumber(Double(userInput)!){
                calcDisplay.text = stringFromNumber  // outputs the string in scientific notation
            }
            else{
                calcDisplay.text = userInput
            }
            break
        default:
            break
        }
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

