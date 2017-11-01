//
//  quizSettings.swift
//  Pex2_QuizGame
//
//  Created by Dom Celiano on 10/8/16.
//  Copyright © 2016 Dom Celiano. All rights reserved.
//

import Foundation

struct quizSettings{
    var continents : [(String, Bool)]
    var num_possibilities : Int
    init(){
    continents = [ //the bool portion represents if we will use or not use that continent
        ("africa" , true),
        ("asia", true),
        ("eeu", true),
        ("na", true),
        ("sa", true),
        ("weu", true)
    ]
    num_possibilities = 3
    }
}