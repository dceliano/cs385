//
//  GameViewController.swift
//  PEX4
//
//  Created by Dom Celiano on 11/19/16.
//  Copyright © 2016 Dom Celiano. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var turnLeftButton: UIButton!
    @IBOutlet weak var turnRightButton: UIButton!
    @IBOutlet weak var executeButton: UIButton!
    var mainScene = GameScene()
    var buttonPressed : String = "" //the name of which button is pressed
    @IBOutlet weak var commandLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                mainScene = scene as! GameScene
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
        
    }
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        commandLabel.text = "Scale: \(scrollView.zoomScale)"
    }
    @IBAction func forwardButtonPressed(_ sender: Any) {
        buttonPressed = "forwardButton"
        commandLabel.text = "Forward..."
    }
    @IBAction func HaltButtonPressed(_ sender: Any) {
        buttonPressed = "haltButton"
        commandLabel.text = "Flight..."
    }
    @IBAction func leftFlankButtonPressed(_ sender: Any) {
        buttonPressed = "leftFlankButton"
        commandLabel.text = "Left Flank..."
    }
    @IBAction func rightFlankButtonPressed(_ sender: Any) {
        buttonPressed = "rightFlankButton"
        commandLabel.text = "Right Flank..."
    }
    @IBAction func leftTurnButtonPressed(_ sender: Any) {
        buttonPressed = "leftTurnButton"
        commandLabel.text = "Column Left..."
    }
    @IBAction func rightTurnButtonPressed(_ sender: Any) {
        buttonPressed = "rightTurnButton"
        commandLabel.text = "Column Right..."
    }
    @IBAction func executeButtonPressed(_ sender: Any) {
        executeCommand(button: buttonPressed)
    }
    @IBAction func cancelButtonPressed(_ sender: Any) {
        buttonPressed = ""
        commandLabel.text = "As You Were!"
    }
    @IBAction func stepButtonPressed(_ sender: Any) {
         commandLabel.text = "Get In Step!"
    }
    @IBAction func dressButtonPressed(_ sender: Any) {
         commandLabel.text = "Get Your Dress!"
    }
    @IBAction func coverButtonPressed(_ sender: Any) {
         commandLabel.text = "Cover!"
    }
    @IBAction func distanceButtonPressed(_ sender: Any) {
         commandLabel.text = "Fix Your Distance!"
    }
    @IBAction func cadenceLeftButtonPressed(_ sender: Any) {
        commandLabel.text = "Left..."
    }
    @IBAction func cadenceRightButtonPressed(_ sender: Any) {
        commandLabel.text = "Right..."
    }
    
    @IBAction func menuButtonPressed(_ sender: Any) {
        commandLabel.text = "Menu"
    }
    func executeCommand(button: String){
        switch button{
            case "": //no button was pressed
                commandLabel.text = ("Give the preemptive command first!")
            case "forwardButton":
                mainScene.goForward()
                commandLabel.text?.append("Harch!")
            case "rightFlankButton":
                mainScene.rightFlank()
                commandLabel.text?.append("Harch!")
            case "leftFlankButton":
                mainScene.leftFlank()
                commandLabel.text?.append("Harch!")
            case "rightTurnButton":
                mainScene.turnRight()
                commandLabel.text?.append("Harch!")
            case "leftTurnButton":
                mainScene.turnLeft()
                commandLabel.text?.append("Harch!")
            case "haltButton":
                mainScene.halt()
                commandLabel.text?.append("Halt!")
            default:
                mainScene.halt()
                commandLabel.text?.append("Halt!")
        }
    }
    @IBAction func zoomIn(_ sender: Any) {
        mainScene.zoomCameraIn()
    }
    @IBAction func zoomOut(_ sender: Any) {
        mainScene.zoomCameraOut()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
