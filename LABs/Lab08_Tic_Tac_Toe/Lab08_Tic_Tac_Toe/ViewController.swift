//
//  ViewController.swift
//  Lab08_Tic_Tac_Toe
//
//  Created by T6A User on 9/1/16.
//  Copyright © 2016 USAFA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myModel = TTTModel()
    
    @IBAction func takeTurn(sender: TTTUIButton){
        print(myModel)
        let prev_turn = myModel.whoTurn
        do{
            try myModel.makeMove(turn: myModel.whoTurn, location: (sender.row, sender.col))
        }
        catch{
            print("Failed to take turn.")
        }
        sender.setTitle(prev_turn.rawValue, forState: .Normal)
    }
    @IBAction func reset(sender: AnyObject) {
        myModel.reset()
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

