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
    @IBAction func speedChanged(_ sender: Any) {
        speedLabel.text = String(speedStepper.value)
        sourceVC.gameScene.speedSetting = CGFloat(speedStepper.value)
    }
    @IBAction func numCadetsChanged(_ sender: Any) {
        numCadetsLabel.text = String(Int(numCadetsStepper.value))
        sourceVC.gameScene.myModel.numCadets = Int(numCadetsStepper.value)
        sourceVC.gameScene.updateFlightSize()
    }
    @IBAction func numElementsChanged(_ sender: Any) {
        numElementsLabel.text = String(Int(numElementsStepper.value))
        sourceVC.gameScene.myModel.numElements = Int(numElementsStepper.value)
        sourceVC.gameScene.updateFlightSize()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = false
    }
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
