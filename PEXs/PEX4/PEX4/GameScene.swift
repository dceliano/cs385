//
//  GameScene.swift
//  PEX4
//
//  Created by Dom Celiano on 11/19/16.
//  Copyright © 2016 Dom Celiano. All rights reserved.
//
//I took quite a bit of code from this tutorial: https://www.raywenderlich.com/118225/introduction-sprite-kit-scene-editor

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var cadetSpeed: CGFloat = 1.0
    var cadet: SKSpriteNode?
    var direction: String = "up" //start as moving up
    let cadetUpAtlas = SKTextureAtlas(named:"CadetWalkUp.atlas")
    let cadetDownAtlas = SKTextureAtlas(named:"CadetWalkDown.atlas")
    let cadetRightAtlas = SKTextureAtlas(named:"CadetWalkRight.atlas")
    let cadetLeftAtlas = SKTextureAtlas(named:"CadetWalkLeft.atlas")
    var cadetUpSprites = Array<SKTexture>()
    var cadetDownSprites = Array<SKTexture>()
    var cadetLeftSprites = Array<SKTexture>()
    var cadetRightSprites = Array<SKTexture>()
    
    var lastTouch: CGPoint? = nil
    
    override func didMove(to view: SKView) {
        setupAtlasArrays()
        //setup the cadet
        cadet = SKSpriteNode(texture: cadetUpSprites[1])
        cadet?.position = CGPoint(x: self.frame.midX + 175, y: self.frame.midY)
        cadet?.size.width = (cadet?.size.width)! / 5
        cadet?.size.height = (cadet?.size.height)! / 5
        cadetSpeed = 0.0 //make the cadet still at the beginning
        addChild(self.cadet!)
    }
    
    func getWalkAction(dir: String) -> SKAction{
        var animateCadet = SKAction()
        var repeatAction = SKAction()
        if (dir == "up"){
            animateCadet = SKAction.animate(with: self.cadetUpSprites, timePerFrame: 0.2)
        }
        else if (dir == "down"){
            animateCadet = SKAction.animate(with: self.cadetDownSprites, timePerFrame: 0.2)
        }
        else if (dir == "right"){
            animateCadet = SKAction.animate(with: self.cadetRightSprites, timePerFrame: 0.2)
        }
        else{ //left
            animateCadet = SKAction.animate(with: self.cadetLeftSprites, timePerFrame: 0.2)
        }
        repeatAction = SKAction.repeatForever(animateCadet)
        return repeatAction
    }
    
    
    // MARK: Touch Handling
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        handleTouches(touches: touches)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        handleTouches(touches: touches)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        handleTouches(touches: touches)
    }
    
    private func handleTouches(touches: Set<UITouch>) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            lastTouch = touchLocation
        }
    }
    
    //MARK: Updates
    
    override func didSimulatePhysics() {
        if let _ = cadet {
            updateCadet()
        }
    }
    
    
    // Updates the cadet's position depending on which direction we're moving in
    func updateCadet() {
        if cadetSpeed <= 0{
            self.cadet?.removeAction(forKey: "animation1")
        }
        else{ //if we're moving
            if direction == "up"{
                cadet!.position.y += cadetSpeed
            }
            else if direction == "down"{
                cadet!.position.y -= cadetSpeed
            }
            else if direction == "right"{
                cadet!.position.x += cadetSpeed
            }
            else{ //left
                cadet!.position.x -= cadetSpeed
            }
        }
        updateCamera()
    }
    
    func halt(){
        cadetSpeed = 0.0
        self.cadet?.removeAction(forKey: "animation1") //stop the animation
        //set image[1] (the standstill image) to be the one that is displayed.
        if direction == "up" {cadet?.texture = cadetUpSprites[1]}
        if direction == "down" {cadet?.texture = cadetDownSprites[1]}
        if direction == "right" {cadet?.texture = cadetRightSprites[1]}
        if direction == "left" {cadet?.texture = cadetLeftSprites[1]}
    }
    
    func goForward(){
        cadetSpeed = 1.0
        self.cadet?.removeAction(forKey: "animation1")
        self.cadet?.run(getWalkAction(dir: direction), withKey: "animation1")
    }
    
    func turnLeft(){
        cadetSpeed = 1.0
        if direction == "up"{
            direction = "left"
        }
        else if direction == "down"{
            direction = "right"
        }
        else if direction == "right"{
            direction = "up"
        }
        else{ //left
            direction = "down"
        }
        self.cadet?.removeAction(forKey: "animation1")
        self.cadet?.run(getWalkAction(dir: direction), withKey: "animation1")
    }
    
    func turnRight(){
        cadetSpeed = 1.0
        if direction == "up"{
            direction = "right"
        }
        else if direction == "down"{
            direction = "left"
        }
        else if direction == "right"{
            direction = "down"
        }
        else{ //left
            direction = "up"
        }
        self.cadet?.removeAction(forKey: "animation1")
        self.cadet?.run(getWalkAction(dir: direction), withKey: "animation1")
    }
    
    func updateCamera() {
        if let camera = camera {
            camera.position = CGPoint(x: cadet!.position.x, y: cadet!.position.y)
        }
    }
    
    func setupAtlasArrays(){
        //setting up all of the arrays and loading the atlas images into the atlas arrays
        cadetUpSprites.append(cadetUpAtlas.textureNamed("up1"))
        cadetUpSprites.append(cadetUpAtlas.textureNamed("up2"))
        cadetUpSprites.append(cadetUpAtlas.textureNamed("up3"))
        cadetUpSprites.append(cadetUpAtlas.textureNamed("up4"))
        cadetDownSprites.append(cadetDownAtlas.textureNamed("down1"))
        cadetDownSprites.append(cadetDownAtlas.textureNamed("down2"))
        cadetDownSprites.append(cadetDownAtlas.textureNamed("down3"))
        cadetDownSprites.append(cadetDownAtlas.textureNamed("down4"))
        cadetRightSprites.append(cadetRightAtlas.textureNamed("right1"))
        cadetRightSprites.append(cadetRightAtlas.textureNamed("right2"))
        cadetRightSprites.append(cadetRightAtlas.textureNamed("right3"))
        cadetRightSprites.append(cadetRightAtlas.textureNamed("right4"))
        cadetLeftSprites.append(cadetLeftAtlas.textureNamed("left1"))
        cadetLeftSprites.append(cadetLeftAtlas.textureNamed("left2"))
        cadetLeftSprites.append(cadetLeftAtlas.textureNamed("left3"))
        cadetLeftSprites.append(cadetLeftAtlas.textureNamed("left4"))
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
