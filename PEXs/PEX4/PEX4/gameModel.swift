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
    var numCadets = 28
    var numElements = 4
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
    
//    //encoded into NSData file
//    func encodeWithCoder(coder: NSCoder) {
//        coder.encodeObject(self.firstname, forKey:"firstname")
//        coder.encodeObject(self.lastname, forKey:"lastname")
//        coder.encodeObject(self.squadron, forKey:"squadron")
//        coder.encodeObject(self.rank, forKey:"rank")
//        coder.encodeObject(self.birthday, forKey:"birthday")
//        coder.encodeObject(self.notes, forKey:"notes")
//    }
//    
//    //decoded from NSData file
//    required init(coder : NSCoder) {
//        self.firstname = (coder.decodeObjectForKey("firstname") as! String)
//        self.lastname = (coder.decodeObjectForKey("lastname") as! String)
//        self.squadron = coder.decodeObjectForKey("squadron") as! Int
//        self.rank = (coder.decodeObjectForKey("rank") as! String)
//        self.birthday = (coder.decodeObjectForKey("birthday") as! String)
//        self.notes = (coder.decodeObjectForKey("notes") as! String)
//        super.init()
//    }
//    
//    //write the data to the file
//    mutating func writeData() {
//        let myPerData = NSKeyedArchiver.archivedDataWithRootObject(data)
//        myDataFile = docsURL!.URLByAppendingPathComponent("data.txt")
//        myPerData.writeToURL(myDataFile!, atomically: true)
//        
//    }
//    
//    //read the data from the file
//    mutating func readData() {
//        let persondata = NSData(contentsOfURL: myDataFile!)!
//        data = NSKeyedUnarchiver.unarchiveObjectWithData(persondata) as! [Friend]
//    }
}
