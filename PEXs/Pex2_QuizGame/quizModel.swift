//
//  quizModel.swift
//  Pex2_QuizGame
//
//  Created by Dom Celiano on 10/7/16.
//  Copyright © 2016 Dom Celiano. All rights reserved.
//

//DOCUMENTATION: I used this resource quite a bit: https://developer.apple.com/library/content/referencelibrary/GettingStarted/DevelopiOSAppsSwift/Lesson8.html

import Foundation

struct quizModel{
    var num_correct = 0
    var num_questions = 0
    var num_guesses = 0
    var num_pictures = 30 //initially, there are 30 pictures to choose from
    var questionToDisplay = quizViewSettings()
    var oldSettings = quizSettings()
    var imageArray : [(String,String,String)] = []
    var rawImageArray : [(String,String,String)] = []
    var allFilesWithPath = NSBundle.mainBundle().URLsForResourcesWithExtension("png", subdirectory: nil, localization: nil)
    var image_index = 0 //this is updated whenever we make a new question
    var continent_pool = ["africa","asia","eeu","na","sa","weu"]
    var correct_answer_index = 0
    var num_images_in_pool = 30
    var used_image_indicies : Array<Int> = []
    
    mutating func loadImagesIntoArray(){
        for file in allFilesWithPath! {
            let fileName = file.lastPathComponent //the last component of the URL is the filename
            var componentsWithExtension = fileName!.componentsSeparatedByString(".")
            var components = componentsWithExtension[0].componentsSeparatedByString("_")
            self.rawImageArray.append((components[0],components[1], fileName!)) //is filled with ([continent (lowercase letters)], [country name], [full filename])
        }
    }
    
    mutating func getNewQuestion(settings: quizSettings) -> quizViewSettings{
        //make the imageArray based on the rawImageArray, which uses the continent constraints
        //it's probably inefficient to do this every time we make a new question, but it works for now
        imageArray = []
        for i in 0...29{
            if(continent_pool.contains(rawImageArray[i].0)){ //constraints are implemented here - FIX THIS
                imageArray.append(rawImageArray[i])
            }
        }
        num_images_in_pool = imageArray.count
        if(num_questions == 5){
            //the game is over
            used_image_indicies = [] //reset the images which were used
            questionToDisplay.game_over = true
            questionToDisplay.quiz_score = ((100 - 5 * (num_guesses - num_correct)))
        }
        else{
            image_index = Int(arc4random_uniform(UInt32(num_images_in_pool))) //generates a number 0-X inclusive
            while(used_image_indicies.contains(image_index)){ //if the image index appears in the list of used indicies, get a new one
                image_index = Int(arc4random_uniform(UInt32(num_images_in_pool)))
            }
            used_image_indicies.append(image_index)
            questionToDisplay = getAnswerPool(settings)
            num_questions += 1
        }
        return questionToDisplay
    }
    
    mutating func makeGuess(guessIndex: Int) -> Bool{
        num_guesses += 1
        if(guessIndex == correct_answer_index){ //the guess was correct, so get a new question
            num_correct += 1
            return true
        }
        else {
            return false
        }
    }
    
    mutating func resetGame(){
        questionToDisplay.game_over = false
        num_questions = 0
        num_correct = 0
        num_questions = 0
        num_guesses = 0
    }
    
    mutating func getAnswerPool(settings: quizSettings) -> quizViewSettings{
        self.questionToDisplay.image_name = imageArray[image_index].2
        self.questionToDisplay.choices.removeAll()
        correct_answer_index = Int(arc4random_uniform(UInt32(settings.num_possibilities))) //gives the index where the correct answer will be put, 0-X inclusive
        var used_indicies : Array<Int> = []
        while(used_indicies.count != settings.num_possibilities){ //until the array is full
            if(used_indicies.count == correct_answer_index){ //if this is the spot where we're supposed to put the answer
                self.questionToDisplay.choices.append(imageArray[image_index].1)
                used_indicies.append(image_index)
            }
            else{
                let new_image_index = Int(arc4random_uniform(UInt32(num_images_in_pool)))
                if(!used_indicies.contains(new_image_index) && new_image_index != correct_answer_index){
                    self.questionToDisplay.choices.append(imageArray[new_image_index].1)
                    used_indicies.append(new_image_index)
                }
            }
        }
        return questionToDisplay
    }
    mutating func updateAnswerPool(settings: quizSettings) -> Bool{
        //returns whether a new question should be gathered or not
        var constraintsChanged = false
        //check if any constraints were changed in the loop below
        for i in 0...(settings.continents.count-1){
            if (settings.continents[i] != oldSettings.continents[i]){
                constraintsChanged = true
            }
        }
        if(constraintsChanged){
            continent_pool = []
            for i in 0...5{
                if(settings.continents[i].1 == true){ //if the category is enabled
                    continent_pool.append(settings.continents[i].0)
                }
            }
            oldSettings = settings
            return true
        }
        else{
            if(oldSettings.num_possibilities != settings.num_possibilities){
                //then, we know stuff changed and we have to update the possible answers because the answer pool has changed
                //update the continent pool, but reset it first
                getAnswerPool(settings)
            }
            oldSettings = settings
            return false
        }
    }
}