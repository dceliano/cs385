//
//  cadetNode.swift
//  PEX4
//
//  Created by Dom Celiano on 11/20/16.
//  Copyright © 2016 Dom Celiano. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class cadetNode: SKSpriteNode{
    var direction = "up"
    var turning = false
    var marchSpeed: CGFloat = 1.0
    
    init(inputtexture: SKTexture, direction: String){
        super.init(texture: inputtexture, color: UIColor.clear, size: inputtexture.size())
    }
    
    required init?(coder aDecoder: NSCoder) { //this is a required initilizer by SKSpriteNode, but isn't used
        super.init(coder: aDecoder)
    }
}
