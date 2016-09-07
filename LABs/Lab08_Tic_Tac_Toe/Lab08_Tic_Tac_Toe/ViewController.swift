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
    
    @IBOutlet var allButtons: [TTTUIButton]!
    @IBOutlet weak var winLabel: UILabel!
    @IBAction func takeTurn(sender: TTTUIButton){
        let prev_turn = myModel.whoTurn
        do{
            try myModel.makeMove(turn: myModel.whoTurn, location: (sender.row, sender.col))
            sender.setTitle(prev_turn.rawValue, forState: .Normal)
            
        }
        catch{
            print("Failed to take turn.")
            myModel.turnsTaken = myModel.turnsTaken - 1
        }
        switch myModel.hasWon() {
        case .x?:
            winLabel.text = "X Wins!"
            for button in allButtons{
                button.enabled = false
            }
        case .o?:
            winLabel.text = "O Wins!"
            for button in allButtons{
                button.enabled = false
            }
        case nil:
            if(myModel.turnsTaken >= 9){
                winLabel.text = "Draw!"
            }
            else{
                if(myModel.whoTurn == .x){
                    winLabel.text = "X's turn"
                }
                else{
                    winLabel.text = "O's turn"
                }
            }
        default:
            break
        }
        print(myModel)
    }
    @IBAction func reset(sender: AnyObject) {
        myModel.reset()
        for button in allButtons{
            button.setTitle("", forState: .Normal)
        }
        for button in allButtons{
            button.enabled = true
        }
        winLabel.text = "X's turn"
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

