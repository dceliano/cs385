//
//  FriendModel.swift
//  PEX3_CadetsWithFriends
//
//  Created by Dom Celiano on 11/6/16.
//  Copyright © 2016 Troy Weingart. All rights reserved.
//

import UIKit

struct FriendModel : CustomStringConvertible {
    class Friend : NSObject, NSCoding {
        
        var firstname: String?
        var lastname: String?
        var squadron: Int
        var rank : String?
        
        override var description: String {
            return "firstname: \(self.firstname!)\nlastname: \(self.lastname!)\nsquadron:\(self.squadron)\nrank:" +
                "\(self.rank)"
        }
        
        init(firstname: String?, lastname: String?, squadron: Int, rank: String?) {
            self.firstname = firstname
            self.lastname = lastname
            self.squadron = squadron
            self.rank = rank
            super.init()
        }
        
        func encodeWithCoder(coder: NSCoder) {
            coder.encodeObject(self.firstname, forKey:"firstname")
            coder.encodeObject(self.lastname, forKey:"lastname")
            coder.encodeObject(self.squadron, forKey:"squadron")
            coder.encodeObject(self.rank, forKey:"rank")
        }
        
        required init(coder : NSCoder) {
            self.firstname = (coder.decodeObjectForKey("firstname") as! String)
            self.lastname = (coder.decodeObjectForKey("lastname") as! String)
            self.squadron = coder.decodeObjectForKey("squadron") as! Int
            self.rank = (coder.decodeObjectForKey("rank") as! String)
            super.init()
        }
    }
    
    var data = [
        Friend(firstname: "Dominic", lastname: "Celiano", squadron: 16, rank: "1Lt"),
        Friend(firstname: "Another", lastname: "One", squadron: 37, rank: "Amn")
    ]
    
    var description: String {
        var str = ""
        var mNum = 0
        for movie in data {
            str += "\(mNum) \(movie.description) \n"
            mNum += 1
        }
        return str
    }
    
    var docsURL : NSURL?
    let fm = NSFileHandle?.self
    var myDataFile : NSURL?
    
    init() {
        let fm = NSFileManager()
        do {
            docsURL = try fm.URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: false)
        } catch {
        }
        myDataFile = docsURL!.URLByAppendingPathComponent("data.txt")
        if myDataFile!.checkResourceIsReachableAndReturnError(nil) {
            readData()
        } else {
            let myPerData = NSKeyedArchiver.archivedDataWithRootObject(data)
            myPerData.writeToURL(myDataFile!, atomically: true)
        }
        
    }
    
    mutating func writeData() {
        let myPerData = NSKeyedArchiver.archivedDataWithRootObject(data)
        myDataFile = docsURL!.URLByAppendingPathComponent("data.txt")
        myPerData.writeToURL(myDataFile!, atomically: true)
        
    }
    mutating func readData() {
        let persondata = NSData(contentsOfURL: myDataFile!)!
        data = NSKeyedUnarchiver.unarchiveObjectWithData(persondata) as! [Friend]
        
    }
}