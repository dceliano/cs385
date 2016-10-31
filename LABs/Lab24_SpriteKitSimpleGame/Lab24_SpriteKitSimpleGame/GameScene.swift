//
//  GameScene.swift
//  Lab24_SpriteKitSimpleGame
//
//  Created by Dom Celiano on 10/31/16.
//  Copyright (c) 2016 Dom Celiano. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    // 1
    let player = SKSpriteNode(imageNamed: "player")
    
    override func didMoveToView(view: SKView) {
        // 2
        backgroundColor = SKColor.whiteColor()
        // 3
        player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.5)
        // 4
        addChild(player)
    }
}