//
//  DataModel.swift
//  DataPersis
//
//  Created by Troy Weingart on 10/17/16.
//  Copyright © 2016 Troy Weingart. All rights reserved.
//

import UIKit

class People : CustomStringConvertible {
    
    class Person : NSObject, NSCoding {
        var first : String
        var last : String
        
        override var description : String {
            return first + " " + last
        }
        
        init(first: String, last: String) {
            self.first = first
            self.last = last
            super.init()  // I called this to ensure that any initialization done in NSObject and NSCoding are also done
        }
        
        // this function is required by the NSCoding protocol
        func encodeWithCoder(coder: NSCoder) {
            coder.encodeObject(self.first, forKey: "first") // encodes an object any string is allowed
            coder.encodeObject(self.last, forKey:  "last")
        }
        
        // also required by the NSCoding protocol
        required init(coder : NSCoder) {
            self.first = (coder.decodeObjectForKey("first") as! String) //decodes the object as a String
            self.last = (coder.decodeObjectForKey("last") as! String)
            super.init() // I called this to ensure that any initialization done in NSObject and NSCoding are also done
        }
    }
    
    var persons = [Person(first: "Troy", last: "Weingart"), Person(first: "Del", last: "Christman"),Person(first: "Ronald", last: "Reagan")]
    
    var description: String {
        var str = ""
        for person in persons {
            str += "\(person.first) \(person.last)\n"
        }
        return str
    }
    
    
    var docsURL : NSURL?  // a reference to the documents directory on the simulator or iOS device
    var myDataFile : NSURL?  // a reference to the file in the docouments directory
    
    init() {
        // need a file manager object to do file operations
        let fm = NSFileManager()
        
        // check if the directory is there and returning a refernece to the documents directory
        do {
            docsURL = try fm.URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: false)
        } catch {
            // should do something smart here
        }
        // create a reference to the file we want to read/write to
        myDataFile = docsURL!.URLByAppendingPathComponent("data.txt")
        
        // if that reference is already there we should load the existing data or create a new file from 
        // the persons array initialized above
        if myDataFile!.checkResourceIsReachableAndReturnError(nil) {
            loadData()  // file is already there so we must have already run this app at least once so 
                        // load the data
        } else {
            // no file so create a default file with the entries in the perons array
            let myPerData = NSKeyedArchiver.archivedDataWithRootObject(persons)
            myPerData.writeToURL(myDataFile!, atomically: true)
        }
        
    }
    
    func saveData() {
        // create an archievable object from the perons array and write it out to the file system
        let myPerData = NSKeyedArchiver.archivedDataWithRootObject(persons)
        myDataFile = docsURL!.URLByAppendingPathComponent("data.txt")
        myPerData.writeToURL(myDataFile!, atomically: true)
        
    }
    func loadData() {
        // use the NSData constructor to read the contents of the data file and then
        // unarchieve it and downcast it as an array of persons
        let persondata = NSData(contentsOfURL: myDataFile!)!
        persons = NSKeyedUnarchiver.unarchiveObjectWithData(persondata) as! [Person]
        
    }
}

