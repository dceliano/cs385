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
        return false
    }
    
    mutating func getAnswerPool(settings: quizSettings) -> quizViewSettings{
        //THIS IS ALL TEMPORARY BECAUSE IT DOESN'T USE THE CONTINENT CONSTRAINTS.
        self.questionToDisplay.image_name = imageArray[image_index].2
        self.questionToDisplay.choices = [imageArray[image_index].1] //TEMPORARY: set the first image in the array to image #1
        var used_indicies : Array<Int> = [image_index]
        while(used_indicies.count != settings.num_possibilities){ //until the array is full
            let new_index = Int(arc4random_uniform(30))
            if(!used_indicies.contains(new_index)){
                self.questionToDisplay.choices.append(imageArray[new_index].1)
                used_indicies.append(new_index)
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