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
    var gameScene = GameScene()
    var buttonPressed : String = "" //the name of which button is pressed
    @IBOutlet weak var commandLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'MainMenuScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                gameScene = scene as! GameScene
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                gameScene.viewController = self //so we can reference this view controller in the scene
                // Present the scene
                view.presentScene(scene)
            }
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
        self.navigationController?.isNavigationBarHidden = true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as! menuViewController).sourceVC = self
        (self.view as! SKView).isPaused = true
    }
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        commandLabel.text = "Scale: \(scrollView.zoomScale)"
    }
    func halfStepError(){
        commandLabel.text = "You can't do that while in half steps!"
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
                gameScene.goForward()
                commandLabel.text?.append("Harch!")
            case "rightFlankButton":
                if !gameScene.inHalfSteps{
                    gameScene.rightFlank()
                    commandLabel.text?.append("Harch!")
                }
                else{
                    halfStepError()
                }
            case "leftFlankButton":
                if !gameScene.inHalfSteps{
                    gameScene.leftFlank()
                    commandLabel.text?.append("Harch!")
                }
                else{
                    halfStepError()
                }
            case "rightTurnButton":
                if !gameScene.inHalfSteps{
                    gameScene.turnRight()
                    commandLabel.text?.append("Harch!")
                }
                else{
                    halfStepError()
                }
            case "leftTurnButton":
                if !gameScene.inHalfSteps{
                    gameScene.turnLeft()
                    commandLabel.text?.append("Harch!")
                }
                else{
                    halfStepError()
                }
            case "haltButton":
                gameScene.halt()
                commandLabel.text?.append("Halt!")
            default:
                gameScene.halt()
                commandLabel.text?.append("Halt!")
        }
    }
    @IBAction func zoomIn(_ sender: Any) {
        gameScene.zoomCameraIn()
    }
    @IBAction func zoomOut(_ sender: Any) {
        gameScene.zoomCameraOut()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
