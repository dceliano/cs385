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
    let numCadets = 24
    var cadetArray: Array<cadetNode> = []
    var formationCenter = CGPoint(x: 0, y: 0)
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
        for i in 0...numCadets - 1{
            let cadet = cadetNode(inputtexture: cadetUpSprites[1], direction: "up")
            let xoffset = (i % 4) * 5 // side-to-side spacing
            let yoffset = floor(Double(i / 4)) * 5 // back-to-front spacing
            cadet.position = CGPoint(x: 450 + xoffset, y: 750 + Int(yoffset))
            cadet.size.width = (cadet.size.width) / 5
            cadet.size.height = (cadet.size.height) / 5
            cadetSpeed = 0.0 //make the cadet still at the beginning
            cadetArray.append(cadet)
        }
        for cadet in cadetArray{
            addChild(cadet)
        }
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
        updateCadets()
    }
    
    
    // Updates the cadet's position depending on which direction we're moving in
    func updateCadets() {
        var i = 0
        for cadet in cadetArray{
            i += 1
            if cadetSpeed <= 0{
                cadet.removeAction(forKey: "animation1")
            }
            else{ //if we're moving
                if cadet.direction == "up"{
                    cadet.position.y += cadetSpeed
                }
                else if cadet.direction == "down"{
                    cadet.position.y -= cadetSpeed
                }
                else if cadet.direction == "right"{
                    cadet.position.x += cadetSpeed
                }
                else{ //left
                    cadet.position.x -= cadetSpeed
                }
            }
            if (i == numCadets / 2){ //the center of the formation is where the middle cadet is
                formationCenter = CGPoint(x: cadet.position.x, y: cadet.position.y)
            }
        }
        updateCamera()
    }
    
    func halt(){
        cadetSpeed = 0.0
        for cadet in cadetArray{
            cadet.removeAction(forKey: "animation1") //stop the animation
            //set image[1] (the standstill image) to be the one that is displayed.
            if cadet.direction == "up" {cadet.texture = cadetUpSprites[1]}
            if cadet.direction == "down" {cadet.texture = cadetDownSprites[1]}
            if cadet.direction == "right" {cadet.texture = cadetRightSprites[1]}
            if cadet.direction == "left" {cadet.texture = cadetLeftSprites[1]}
        }
    }
    
    func goForward(){
        cadetSpeed = 1.0
        for cadet in cadetArray{
            cadet.removeAction(forKey: "animation1")
            cadet.run(getWalkAction(dir: cadet.direction), withKey: "animation1")
        }
    }
    
    func leftFlank(){
        cadetSpeed = 1.0
        for cadet in cadetArray{
            if cadet.direction == "up"{
                cadet.direction = "left"
            }
            else if cadet.direction == "down"{
                cadet.direction = "right"
            }
            else if cadet.direction == "right"{
                cadet.direction = "up"
            }
            else{ //left
                cadet.direction = "down"
            }
            cadet.removeAction(forKey: "animation1")
            cadet.run(getWalkAction(dir: cadet.direction), withKey: "animation1")
        }
    }
    
    func rightFlank(){
        cadetSpeed = 1.0
        for cadet in cadetArray{
            if cadet.direction == "up"{
                cadet.direction = "right"
            }
            else if cadet.direction == "down"{
                cadet.direction = "left"
            }
            else if cadet.direction == "right"{
                cadet.direction = "down"
            }
            else{ //left
                cadet.direction = "up"
            }
            cadet.removeAction(forKey: "animation1")
            cadet.run(getWalkAction(dir: cadet.direction), withKey: "animation1")
        }
    }
    
    func updateCamera() {
        if let camera = camera {
            camera.position = CGPoint(x: formationCenter.x, y: formationCenter.y)
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
