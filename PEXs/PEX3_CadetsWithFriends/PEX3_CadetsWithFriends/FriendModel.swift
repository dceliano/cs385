//
//  FriendModel.swift
//  PEX3_CadetsWithFriends
//
//  Created by Dom Celiano on 11/6/16.
//  Copyright © 2016 Troy Weingart. All rights reserved.
//

import UIKit

struct FriendModel : CustomStringConvertible{
    class Friend : NSObject, NSCoding {
        //variables of the friend class
        var firstname: String?
        var lastname: String?
        var squadron: Int
        var rank : String?
        var birthday : String?
        var notes : String?
        
        //this is what will get stored in the NSData file
        override var description: String {
            return "firstname: \(self.firstname!)\nlastname: \(self.lastname!)\nsquadron: \(self.squadron)\nrank: \(self.rank)\nbirthday: \(self.birthday)\nnotes: \(self.notes)"
        }
        
        //allow the varibales to be initialized
        init(firstname: String?, lastname: String?, squadron: Int, rank: String?, birthday: String?, notes: String?) {
            self.firstname = firstname
            self.lastname = lastname
            self.squadron = squadron
            self.rank = rank
            self.birthday = birthday
            self.notes = notes
            super.init()
        }
        
        //encoded into NSData file
        func encodeWithCoder(coder: NSCoder) {
            coder.encodeObject(self.firstname, forKey:"firstname")
            coder.encodeObject(self.lastname, forKey:"lastname")
            coder.encodeObject(self.squadron, forKey:"squadron")
            coder.encodeObject(self.rank, forKey:"rank")
            coder.encodeObject(self.birthday, forKey:"birthday")
            coder.encodeObject(self.notes, forKey:"notes")
        }
        
        //decoded from NSData file
        required init(coder : NSCoder) {
            self.firstname = (coder.decodeObjectForKey("firstname") as! String)
            self.lastname = (coder.decodeObjectForKey("lastname") as! String)
            self.squadron = coder.decodeObjectForKey("squadron") as! Int
            self.rank = (coder.decodeObjectForKey("rank") as! String)
            self.birthday = (coder.decodeObjectForKey("birthday") as! String)
            self.notes = (coder.decodeObjectForKey("notes") as! String)
            super.init()
        }
    }
    
    //Example data to get us started
    var data = [
        Friend(firstname: "Dominic", lastname: "Celiano", squadron: 16, rank: "C/1st Lt", birthday: "07-07-1994", notes: "Me!"),
        Friend(firstname: "Jane", lastname: "Doe", squadron: 37, rank: "C/2d Lt", birthday: "04-04-1989", notes: "Who is this person?")]
    
    //make the total description the descriptions of reach friend
    var description: String {
        var str = ""
        var fNum = 0
        for friend in data {
            str += "\(fNum) \(friend.description) \n"
            fNum += 1
        }
        return str
    }
    
    //get the file information for NSData persistence
    var docsURL : NSURL?
    let fm = NSFileHandle?.self
    var myDataFile : NSURL?
    
    init() {
        let fm = NSFileManager()
        do {
            docsURL = try fm.URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: false)
        } catch {
        }
        myDataFile = docsURL!.URLByAppendingPathComponent("data5.txt")
        if myDataFile!.checkResourceIsReachableAndReturnError(nil) {
            readData()
        } else {
            let myPerData = NSKeyedArchiver.archivedDataWithRootObject(data)
            myPerData.writeToURL(myDataFile!, atomically: true)
        }
        
    }
    
    //write the data to the file
    mutating func writeData() {
        let myPerData = NSKeyedArchiver.archivedDataWithRootObject(data)
        myDataFile = docsURL!.URLByAppendingPathComponent("data5.txt")
        myPerData.writeToURL(myDataFile!, atomically: true)
        
    }
    
    //read the data from the file
    mutating func readData() {
        let persondata = NSData(contentsOfURL: myDataFile!)!
        data = NSKeyedUnarchiver.unarchiveObjectWithData(persondata) as! [Friend]
    }
}