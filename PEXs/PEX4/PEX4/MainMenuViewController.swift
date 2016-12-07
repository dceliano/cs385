//
//  MainMenuViewController.swift
//  PEX4
//
//  Created by Dom Celiano on 12/5/16.
//  Copyright © 2016 Dom Celiano. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    @IBOutlet weak var LoadingButtonLabel: UIButton!

    @IBAction func newButtonPressed(_ sender: Any) {
        LoadingButtonLabel.setTitle("New Game Loading...", for: UIControlState.normal)
    }
    
    @IBAction func loadButtonPressed(_ sender: Any) {
        LoadingButtonLabel.setTitle("Saved Game Loading...", for: UIControlState.normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nav = segue.destination as! UINavigationController
        if segue.identifier == "loadSegue"{
            print("loading game")
            (nav.topViewController as! GameViewController).shouldLoadData = true
        }
        else{
            print("starting new game")
            (nav.topViewController as! GameViewController).shouldLoadData = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
