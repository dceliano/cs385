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
    LoadingButtonLabel.setTitle("Game is Loading...", for: UIControlState.normal)
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
