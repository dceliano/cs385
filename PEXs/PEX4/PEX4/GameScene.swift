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
    
    let cadetSpeed: CGFloat = 150.0
    var cadet: SKSpriteNode?
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
        // Setup cadet with animation
        setupAtlasArrays()
        cadet = SKSpriteNode(texture: cadetUpSprites[0])
        cadet?.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        //cadet?.size.width = (cadet?.size.width)! / 10
        //cadet?.size.height = (cadet?.size.height)! / 10
        let repeatAction = getWalkAction(dir: "up")
        self.cadet?.run(repeatAction, withKey: "animation1")
        addChild(self.cadet!)
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
    
    func getWalkAction(dir: String) -> SKAction{
        var animateCadet = SKAction()
        var repeatAction = SKAction()
        if (dir == "up"){
            animateCadet = SKAction.animate(with: self.cadetUpSprites, timePerFrame: 0.2)
        }
        else if (dir == "down"){
            animateCadet = SKAction.animate(with: self.cadetUpSprites, timePerFrame: 0.2)
        }
        else if (dir == "right"){
            animateCadet = SKAction.animate(with: self.cadetUpSprites, timePerFrame: 0.2)
        }
        else{
            animateCadet = SKAction.animate(with: self.cadetUpSprites, timePerFrame: 0.2)
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
    
    // Determines if the cadet's position should be updated
    func shouldMove(currentPosition: CGPoint, touchPosition: CGPoint) -> Bool {
        return abs(currentPosition.x - touchPosition.x) > cadet!.frame.width / 2 ||
            abs(currentPosition.y - touchPosition.y) > cadet!.frame.height/2
    }
    
    // Updates the cadet's position by moving towards the last touch made
    func updateCadet() {
        if let touch = lastTouch {
            let currentPosition = cadet!.position
            if shouldMove(currentPosition: currentPosition, touchPosition: touch) {
                
                let distance = CGPoint(x: currentPosition.y - touch.y, y: currentPosition.x - touch.x)
                let distance_to_move = sqrt((distance.x*distance.x) + (distance.y*distance.y))
                let angle = atan2(distance.x, distance.y) + CGFloat(M_PI)
//                let rotateAction = SKAction.rotate(toAngle: angle + CGFloat(M_PI*0.5), duration: 0)
//                
//                cadet!.run(rotateAction)
                
                let velocityX = cadetSpeed * cos(angle)
                let velocityY = cadetSpeed * sin(angle)
                
                let newVelocity = CGVector(dx: velocityX, dy: velocityY)
                //cadet!.physicsBody!.velocity = newVelocity
                updateCamera()
            } else {
                cadet!.physicsBody!.isResting = true
            }
        }
    }
    
    func updateCamera() {
        if let camera = camera {
            camera.position = CGPoint(x: cadet!.position.x, y: cadet!.position.y)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
