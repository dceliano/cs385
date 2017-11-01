//
//  ViewController.swift
//  GR1_GuessGame
//
//  Created by Troy Weingart on 9/29/16.
//  Copyright © 2016 Troy Weingart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    var myModel = GameModel() //instantiation
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBAction func sliderReleased(sender: AnyObject) {
        let theResult = myModel.tryAttempt(guess: Int(slider.value))
        if (theResult == .equal){
            statusLabel.text = "Winner"
            slider.enabled = false //disable slider
        }
        if (theResult == .low){
            statusLabel.text = "Your guess was low..."
        }
        if(theResult == .high){
            statusLabel.text = "Your guess was high..."
        }
        else{
            statusLabel.text = ""
        }
    }
    
    @IBAction func newGame(sender: AnyObject) {
        slider.enabled = true //re-enable slider
        statusLabel.text = ""
        slider.value = 0
        numberLabel.text = String(Int(slider.value))
        myModel.startNewGame()
    }
    
    @IBAction func valueChanged(sender: AnyObject) {
        numberLabel.text = String(Int(slider.value))
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

