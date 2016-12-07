//
//  myModel.swift
//  PEX4
//
//  Created by Dom Celiano on 11/20/16.
//  Copyright © 2016 Dom Celiano. All rights reserved.
//

import Foundation
import CoreGraphics

struct gameModel: CustomStringConvertible{
    class gameModel: NSObject, NSCoding{
        //game properties
        var distanceMarched : Int = 0
        var numCadets = 28
        var numElements = 4
        var numRanks = 0 //calculated in the gameScene
        var distanceBetweenCadets = 5 //measured in pixels
        
        //flight commander (user) properties
        var numMistakesMade : Int = 0
        var guidonLocation : CGPoint? = nil
        var level : Int = 0
        var numChallengesComplete : Int = 0
        
        //this is what will get stored in the NSData file
        override var description: String {
            return "level: \(self.level)\nnumMistakesMade: \(self.numMistakesMade)\ndistanceMarched: \(self.distanceMarched)\nnumChallengesComplete: \(self.numChallengesComplete)"
        }
        override init(){
            print("initialized")
        }
        
        //encoded into NSData file
        func encode(with aCoder: NSCoder) {
            aCoder.encode(self.level, forKey:"level")
            aCoder.encode(self.numMistakesMade, forKey:"numMistakesMade")
            aCoder.encode(self.distanceMarched, forKey:"distanceMarched")
            aCoder.encode(self.numChallengesComplete, forKey:"numChallengesComplete")
        }
        
        //decoded from NSData file
        required init(coder : NSCoder) {
            self.level = (coder.decodeObject(forKey: "level") as! Int)
            self.numMistakesMade = (coder.decodeObject(forKey: "numMistakesMade") as! Int)
            self.distanceMarched = (coder.decodeObject(forKey: "distanceMarched") as! Int)
            self.numChallengesComplete = (coder.decodeObject(forKey: "numChallengesComplete") as! Int)
            super.init()
        }
    }
    
    
    //make the total description the descriptions of reach friend
    var description: String {
        return gameModel.description()
    }
    
    var data : Array<gameModel> = []
    
    //get the file information for NSData persistence
    var docsURL : NSURL?
    let fm = FileHandle?.self
    var myDataFile : NSURL?
    
    init() {
        let fm = FileManager()
        do {
            docsURL = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL?
        } catch {
        }
        myDataFile = docsURL!.appendingPathComponent("data.txt") as NSURL?
        if myDataFile!.checkResourceIsReachableAndReturnError(nil) {
            readData()
        } else {
            let myGameData = NSKeyedArchiver.archivedData(withRootObject: data)
            do{
                try myGameData.write(to: self.myDataFile! as URL)
            } catch{
                print("error")
            }
        }
        
    }
    
    //write the data to the file
    mutating func writeData() {
        let myGameData = NSKeyedArchiver.archivedData(withRootObject: data)
        myDataFile = docsURL!.appendingPathComponent("data.txt") as NSURL?
        do{
            try myGameData.write(to: self.myDataFile! as URL)
        } catch{
            print("error")
        }
        
    }

    //read the data from the file
    mutating func readData() {
        let gameData = NSData(contentsOf: myDataFile! as URL)!
        data = [NSKeyedUnarchiver.unarchiveObject(with: gameData as Data) as! gameModel]
    }
}
