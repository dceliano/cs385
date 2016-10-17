//
//  quizModel.swift
//  Pex2_QuizGame
//
//  Created by Dom Celiano on 10/7/16.
//  Copyright © 2016 Dom Celiano. All rights reserved.
//

//DOCUMENTATION: I used this resource heavily: https://developer.apple.com/library/content/referencelibrary/GettingStarted/DevelopiOSAppsSwift/Lesson8.html

import Foundation

struct quizModel{
    var num_correct = 0 //initialize all of these values to 0
    var num_questions = 0
    var num_guesses = 0
    var questionToDisplay = quizViewSettings()
    var oldSettings = quizSettings()
    
    mutating func getNewQuestion() -> quizViewSettings{
        //TEMPORARY
        self.questionToDisplay.image_name = "africa_Egypt.png"
        self.questionToDisplay.choices = ["Africa", "North America", "Asia"]
        return questionToDisplay
    }
    mutating func makeGuess(guessIndex: Int) -> Bool{
        return false
    }
    mutating func getAnswerPool(settings: quizSettings){
        //TEMPORARY
        self.questionToDisplay.choices.append("South America")
        self.questionToDisplay.choices.append("Eastern Europe")
        self.questionToDisplay.choices.append("Western Europe")
    }
    mutating func updateAnswerPool(settings: quizSettings){
        if((oldSettings.continents != settings.continents) || (oldSettings.num_possibilities != settings.num_possibilities)){
            //then, we know stuff changed and we have to update the possible answers because the answer pool has changed
            //UPDATE THE ANSWER POOL CONSTRAINTS HERE
            getAnswerPool(settings)
        }
        oldSettings = settings
    }
}