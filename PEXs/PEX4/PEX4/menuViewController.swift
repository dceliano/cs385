//
//  menuViewController.swift
//  PEX4
//
//  Created by Dom Celiano on 12/5/16.
//  Copyright © 2016 Dom Celiano. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class menuViewController: UIViewController, UIScrollViewDelegate {
    var sourceVC = GameViewController()
    @IBOutlet weak var speedStepper: UIStepper!
    @IBOutlet weak var numCadetsStepper: UIStepper!
    @IBOutlet weak var numElementsStepper: UIStepper!
    @IBOutlet weak var numElementsLabel: UILabel!
    @IBOutlet weak var numCadetsLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var currentLevelLabel: UILabel!
    @IBOutlet weak var levelProgressLabel: UILabel!
    @IBAction func speedChanged(_ sender: Any) {
        //when we change speed
        speedLabel.text = String(speedStepper.value)
        sourceVC.gameScene.speedSetting = CGFloat(speedStepper.value)
    }
    @IBAction func numCadetsChanged(_ sender: Any) {
        //when we add or remove cadets
        numCadetsLabel.text = String(Int(numCadetsStepper.value))
        sourceVC.gameScene.myModel.numCadets = Int(numCadetsStepper.value)
    }
    @IBAction func numElementsChanged(_ sender: Any) {
        //change the number of elements in the flight
        numElementsLabel.text = String(Int(numElementsStepper.value))
        sourceVC.gameScene.myModel.numElements = Int(numElementsStepper.value)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillDisappear(_ animated: Bool) {
        //this is called when we dismiss the menu view
        (sourceVC.view as! SKView).isPaused = false
        sourceVC.gameScene.updateFlightSize()
    }
    override func viewDidAppear(_ animated: Bool) {
        //set up stuff as soon as the view is loaded, such as the previous stepper values
        speedStepper.value = Double(sourceVC.gameScene.speedSetting)
        numCadetsStepper.value = Double(sourceVC.gameScene.myModel.numCadets)
        numElementsStepper.value = Double(sourceVC.gameScene.myModel.numElements)
        speedLabel.text = String(speedStepper.value)
        sourceVC.commandLabel.text = ""
        numCadetsLabel.text = String(Int(numCadetsStepper.value))
        numElementsLabel.text = String(Int(numElementsStepper.value))
        levelProgressLabel.text = String(Int(sourceVC.myModel.distanceMarched / 10))
        self.navigationController?.isNavigationBarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
