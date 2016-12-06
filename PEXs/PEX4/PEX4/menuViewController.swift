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
    var menuScene = MenuScene()

    override func loadView(){
        self.view = SKView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'MainMenuScene.sks'
            if let scene = SKScene(fileNamed: "MenuScene") {
                menuScene = scene as! MenuScene
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                // Present the scene
                view.presentScene(scene)
            }
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
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
