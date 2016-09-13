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
        userInput += sender.currentTitle!! //add the string to the value input
        calcDisplay.text = userInput
    }
    @IBAction func enterHit(sender: AnyObject){
        addToStack()
        userInput = ""
    }
    @IBAction func opHit(sender: AnyObject){
        addToStack()
    }
    func addToStack(){
        if let number = Double(userInput) {
            myModel.push(number)
            calcDisplay.text = userInput
        } else {
            print(myModel.performOp(userInput))
        }
        stackDisplay.text = String(myModel.stack)
        
    }
    @IBAction func clearHit(sender: AnyObject){
        userInput = ""
        calcDisplay.text = "0"
    }
    @IBAction func trigFuncs(sender: AnyObject){
        
    }
    @IBAction func negativeHit(sender: AnyObject){
        
    }
    @IBAction func backspaceHit(sender: AnyObject){
        
    }
    @IBAction func constHit(sender: AnyObject){
        
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

