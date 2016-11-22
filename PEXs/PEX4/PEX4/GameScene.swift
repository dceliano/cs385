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
    
    var myModel = gameModel()
    var cadetArray: Array<cadetNode> = [] //load a blank array of cadets
    var formationCenter = CGPoint(x: 0, y: 0) //load the camera
    let timePerFrame = 0.2
    //variables to help complete column movements (it's complicated)
    var turnStepCount = 0
    var formationIsTurning : Bool = false //tells us whether we're performing a column movement or not
    var numStepsToCompleteTurn : Int = 0
    //load all of the animation files
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
        setupAtlasArrays() //get the animation frames ready
        //setup the cadets
        for i in 0...myModel.numCadets - 1{
            let cadet = cadetNode(inputtexture: cadetUpSprites[1], direction: "up")
            cadet.element = i % myModel.numElements
            cadet.rank = myModel.numRanks - Int(floor(Double(i / myModel.numElements))) //this makes (0,0) in the top left
            let xoffset = cadet.element * myModel.distanceBetweenCadets // side-to-side spacing
            let yoffset =  -(cadet.rank * myModel.distanceBetweenCadets) // back-to-front spacing
            cadet.position = CGPoint(x: 450 + xoffset, y: 750 + Int(yoffset))
            cadet.size.width = (cadet.size.width) / 5
            cadet.size.height = (cadet.size.height) / 5
            cadet.marchSpeed = 0.0 //make the cadet still at the beginning
            cadetArray.append(cadet)
            numStepsToCompleteTurn = myModel.numElements * 2 + (myModel.numRanks - 1) //this is complicated, but it works
        }
        for cadet in cadetArray{
            addChild(cadet)
        }
    }
    
    
    func getWalkAction(dir: String) -> SKAction{
        var animateCadet = SKAction()
        var repeatAction = SKAction()
        if (dir == "up"){
            animateCadet = SKAction.animate(with: self.cadetUpSprites, timePerFrame: timePerFrame)
        }
        else if (dir == "down"){
            animateCadet = SKAction.animate(with: self.cadetDownSprites, timePerFrame: timePerFrame)
        }
        else if (dir == "right"){
            animateCadet = SKAction.animate(with: self.cadetRightSprites, timePerFrame: timePerFrame)
        }
        else if dir == "left"{
            animateCadet = SKAction.animate(with: self.cadetLeftSprites, timePerFrame: timePerFrame)
        }
        else if dir == "upright"{
            animateCadet = SKAction.animate(with: self.cadetRightSprites, timePerFrame: timePerFrame)
        }
        else if dir == "downright"{
            animateCadet = SKAction.animate(with: self.cadetRightSprites, timePerFrame: timePerFrame)
        }
        else if dir == "upleft"{
            animateCadet = SKAction.animate(with: self.cadetLeftSprites, timePerFrame: timePerFrame)
        }
        else if dir == "downleft"{
            animateCadet = SKAction.animate(with: self.cadetLeftSprites, timePerFrame: timePerFrame)
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
        if formationIsTurning{
            if(turnStepCount >= (numStepsToCompleteTurn - 1)){
                formationIsTurning = false
            }
            else{
                turnStepCount += 1
                for cadet in cadetArray{ //retrieve the appropriate movement based on the premade array of movements
                    cadet.direction = cadet.turnCommandString[turnStepCount]
                    cadet.removeAction(forKey: "animation1")
                    cadet.run(getWalkAction(dir: cadet.direction), withKey: "animation1") //rerun the new animation
                }
            }
        }
        var i = 0
        for cadet in cadetArray{
            i += 1
            if cadet.marchSpeed <= 0{
                cadet.removeAction(forKey: "animation1")
            }
            else{ //if we're moving
                cadet.distanceMoved += 1
                if cadet.direction == "up"{
                    cadet.position.y += cadet.marchSpeed
                }
                else if cadet.direction == "uphalf"{
                    cadet.position.y += cadet.marchSpeed / 2
                }
                else if cadet.direction == "down"{
                    cadet.position.y -= cadet.marchSpeed
                }
                else if cadet.direction == "downhalf"{
                    cadet.position.y -= cadet.marchSpeed / 2
                }
                else if cadet.direction == "right"{
                    cadet.position.x += cadet.marchSpeed
                }
                else if cadet.direction == "righthalf"{
                    cadet.position.x += cadet.marchSpeed / 2
                }
                else if cadet.direction == "left"{
                    cadet.position.x -= cadet.marchSpeed
                }
                else if cadet.direction == "lefthalf"{
                    cadet.position.x -= cadet.marchSpeed / 2
                }
                else if cadet.direction == "upright"{
                    cadet.position.x += cadet.marchSpeed
                    cadet.position.y += cadet.marchSpeed
                }
                else if cadet.direction == "upleft"{
                    cadet.position.x -= cadet.marchSpeed
                    cadet.position.y += cadet.marchSpeed
                }
                else if cadet.direction == "downright"{
                    cadet.position.x += cadet.marchSpeed
                    cadet.position.y -= cadet.marchSpeed
                }
                else if cadet.direction == "downleft"{
                    cadet.position.x -= cadet.marchSpeed
                    cadet.position.y -= cadet.marchSpeed
                }
            }
            if (i == myModel.numCadets / 2){ //the center of the formation is where the middle cadet is
                formationCenter = CGPoint(x: cadet.position.x, y: cadet.position.y)
            }
        }
        updateCamera()
    }
    
    func halt(){
        for cadet in cadetArray{
            cadet.removeAction(forKey: "animation1") //stop the animation
            cadet.marchSpeed = 0.0
            //set image[1] (the standstill image) to be the one that is displayed.
            if cadet.direction == "up" {cadet.texture = cadetUpSprites[1]}
            if cadet.direction == "down" {cadet.texture = cadetDownSprites[1]}
            if cadet.direction == "right" {cadet.texture = cadetRightSprites[1]}
            if cadet.direction == "left" {cadet.texture = cadetLeftSprites[1]}
        }
    }
    
    func goForward(){
        for cadet in cadetArray{
            cadet.marchSpeed = 1.0
            cadet.removeAction(forKey: "animation1")
            cadet.run(getWalkAction(dir: cadet.direction), withKey: "animation1")
        }
    }
    
    func turnRight(){

    }
    
    func turnLeft(){
        //this function begins the turning sequence by resetting the turning variables and loading each cadet's turnCommandString
        turnStepCount = 0
        formationIsTurning = true
        for cadet in cadetArray{
            cadet.turnCommandString = []
            cadet.marchSpeed = 1.0
            if cadet.direction == "up"{
                for _ in 0...cadet.rank{
                    cadet.turnCommandString.append("up") //append the initial straightaway before turning
                }
                if cadet.element != 0{
                    for _ in 0...cadet.element{
                        cadet.turnCommandString.append("upleft") //append all the 45* turns based on the element we're in
                    }
                }
                for _ in 0...cadet.element{
                    cadet.turnCommandString.append("left") //append the straightaways after we complete our turn
                }
                //append the halfsteps after we complete our turn
                for _ in 0...(2 * (myModel.numElements - cadet.element - 1)) + (myModel.numRanks - 1){ //once again, complicated, but it works
                    cadet.turnCommandString.append("lefthalf")
                }
                print("El\(cadet.element) Rank\(cadet.rank) String: \(cadet.turnCommandString)")
            }
            else if cadet.direction == "down"{
                cadet.direction = "downleft"
            }
            else if cadet.direction == "right"{
                cadet.direction = "downright"
            }
            else{ //left
                cadet.direction = "upleft"
            }
            cadet.removeAllActions()
            cadet.run(getWalkAction(dir: cadet.direction), withKey: "animation1")
        }
    }
    
    func leftFlank(){
        for cadet in cadetArray{
            cadet.marchSpeed = 1.0
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
        for cadet in cadetArray{
            cadet.marchSpeed = 1.0
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
    
    func zoomCameraIn(){
        if let camera = camera {
            camera.xScale = camera.xScale / 2
            camera.yScale = camera.yScale / 2
        }
    }
    func zoomCameraOut(){
        if let camera = camera {
            camera.xScale = camera.xScale * 2
            camera.yScale = camera.yScale * 2
        }
    }
    
    func updateCamera() {
        if let camera = camera {
            //the camera follows the center of the formation
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
