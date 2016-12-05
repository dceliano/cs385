//
//  myModel.swift
//  PEX4
//
//  Created by Dom Celiano on 11/20/16.
//  Copyright © 2016 Dom Celiano. All rights reserved.
//

import Foundation
import CoreGraphics

struct gameModel {
    //game properties
    var distanceMarched : Int = 0
    let numCadets = 9
    let numElements = 3
    var numRanks = 0 //calculated automatically
    var distanceBetweenCadets = 5 //measured in pixels
    
    //flight commander (user) properties
    var numMistakesMade : Int = 0
    var guidonLocation : CGPoint? = nil
    var level : Int = 0
    var numChallengesComplete : Int = 0
    
    init(){
        numRanks = numCadets / numElements
    }
}
