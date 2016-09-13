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
    var userInput : String?
    
    //these functions will call different parts of my model.
    @IBOutlet weak var calcDisplay: UILabel!
    @IBAction func numberEntered(sender: CalcNumberButton) {
        userInput?.append((Character(sender.val)))
        calcDisplay.text = "%d",
    }
    
    if let number = Double(userInput!) {
        CalcModel.push(item: number)
    } else {
        try print(CalcModel.performOp(oper: userInput!))
    }
    
    @IBAction func enterHit(sender: AnyObject) {
        //CalcModel.push(sender.val)
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

