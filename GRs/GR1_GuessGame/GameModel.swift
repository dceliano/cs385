//
//  GameModel.swift
//  GR1_GuessGame
//
//  Created by Troy Weingart on 9/29/16.
//  Copyright © 2016 Troy Weingart. All rights reserved.
//

import Foundation

class GameModel {
    
    private var magicNumber : Int = 0 // this will be changed
    
    enum result {
        case equal
        case low
        case high
    }
    
    func tryAttempt(guess guess: Int) -> result {
        var theResult = result.equal //this will be changed
        if(guess == self.magicNumber){
            theResult = .equal
            //you won
        }
        else if (guess < self.magicNumber){
            theResult = .low
            //guess was low
        }
        else{
            theResult = .high
            //guess was high
        }
       return theResult
    }
    
    // any other functions you may need go below here
    func startNewGame(){
        self.magicNumber = Int(arc4random_uniform(100)) + 1 //gives a random number 1-100
    }
}