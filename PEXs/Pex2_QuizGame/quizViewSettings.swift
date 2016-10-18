//
//  quizView.swift
//  Pex2_QuizGame
//
//  Created by Dom Celiano on 10/16/16.
//  Copyright © 2016 Dom Celiano. All rights reserved.
//

import Foundation

struct quizViewSettings{
    var image_name : String
    var choices : Array<String>
    var game_over : Bool
    var quiz_score : Int
    init(){
        image_name = ""
        choices = []
        game_over = false
        quiz_score = 0
    }
}