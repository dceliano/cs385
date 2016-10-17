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
    //initialize all of these values to 0
    var num_correct = 0
    var num_questions = 0
    var num_guesses = 0
    var num_pictures = 30 //initially, there are 30 pictures to choose from
    var questionToDisplay = quizViewSettings()
    var oldSettings = quizSettings()
    var imageArray : [(String,String,String)] = []
    var allFilesWithPath = NSBundle.mainBundle().URLsForResourcesWithExtension("png", subdirectory: nil, localization: nil)
    var image_index = 0 //this is updated whenever we make a new question
    var correct_answer_index = 0
    
    mutating func loadImagesIntoArray(){
        for file in allFilesWithPath! {
            let fileName = file.lastPathComponent //the last component of the URL is the filename
            var componentsWithExtension = fileName!.componentsSeparatedByString(".")
            var components = componentsWithExtension[0].componentsSeparatedByString("_")
            self.imageArray.append((components[0],components[1], fileName!)) //is filled with ([continent (lowercase letters)], [country name], [full filename])
        }
    }
    
    mutating func getNewQuestion(settings: quizSettings) -> quizViewSettings{
        if(num_questions == 10){
            //the game is over
        }
        else{
            image_index = Int(arc4random_uniform(30)) //generates a number 0-29 inclusive, since we have 30 photos
            questionToDisplay = getAnswerPool(settings)
            num_questions += 1
        }
        return questionToDisplay
    }
    
    mutating func makeGuess(guessIndex: Int) -> Bool{
        //TEMPORARY
        if(guessIndex == correct_answer_index){ return true } //the guess was correct
        else { return false }
    }
    
    mutating func getAnswerPool(settings: quizSettings) -> quizViewSettings{
        //THIS IS ALL TEMPORARY BECAUSE IT DOESN'T USE THE CONTINENT CONSTRAINTS.
        self.questionToDisplay.image_name = imageArray[image_index].2
        self.questionToDisplay.choices.removeAll()
        correct_answer_index = Int(arc4random_uniform(UInt32(settings.num_possibilities))) //gives the index where the correct answer will be put, 0-8 inclusive
        print(correct_answer_index)
        var used_indicies : Array<Int> = []
        while(used_indicies.count != settings.num_possibilities){ //until the array is full
            if(used_indicies.count == correct_answer_index){ //if this is the spot where we're supposed to put the answer
                self.questionToDisplay.choices.append(imageArray[image_index].1)
                used_indicies.append(image_index)
            }
            else{
                let new_image_index = Int(arc4random_uniform(30))
                if(!used_indicies.contains(new_image_index)){
                    self.questionToDisplay.choices.append(imageArray[new_image_index].1)
                    used_indicies.append(new_image_index)
                }
            }
        }
        return questionToDisplay
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