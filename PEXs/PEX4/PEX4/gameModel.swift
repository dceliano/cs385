//
//  myModel.swift
//  PEX4
//
//  Created by Dom Celiano on 11/20/16.
//  Copyright © 2016 Dom Celiano. All rights reserved.
//

import Foundation

struct gameModel {
    var distanceMarched : Int = 0
    var mistakesMade : Int = 0
    let numCadets = 8
    let numElements = 4
    var numRanks = 0
    var distanceBetweenCadets = 5 //measured in pixels
    init(){
        numRanks = numCadets / numElements
    }
}
