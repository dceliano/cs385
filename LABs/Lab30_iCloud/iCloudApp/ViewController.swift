//
//  ViewController.swift
//  iCloudTestV7
//
//  Created by Troy Weingart on 11/7/16.
//  Copyright © 2016 Troy Weingart. All rights reserved.
//

import UIKit
import CloudKit

class Cadet : NSObject, NSCoding {
    var id : CKRecordID?
    var name : String = ""
    var rank : String = ""
    var gpa : Float = 0.0
    var squad : Int = 1
    
    override var description : String {
        return "\(id!)\n\(name)\n\(rank)\n\(gpa)\n\(squad)"
    }
    
    override init(){
    }
    
    init(name : String, rank : String, gpa : Float, squad: Int) {
        self.name = name
        self.rank = rank
        self.gpa = gpa
        self.squad = squad
        super.init()  // I called this to ensure that any initialization done in NSObject and NSCoding are also done
    }
    
    // this function is required by the NSCoding protocol
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.name, forKey: "name") // encodes an object any string is allowed
        coder.encodeObject(self.rank, forKey:  "rank")
        coder.encodeObject(self.gpa, forKey:  "gpa")
        coder.encodeObject(self.squad, forKey:  "squad")
    }
    
    // also required by the NSCoding protocol
    required init(coder : NSCoder) {
        self.name = (coder.decodeObjectForKey("name") as! String) //decodes the object as a String
        self.rank = (coder.decodeObjectForKey("rank") as! String)
        self.gpa = (coder.decodeObjectForKey("gpa") as! Float)
        self.squad = (coder.decodeObjectForKey("squad") as! Int)
        super.init() // I called this to ensure that any initialization done in NSObject and NSCoding are also done
    }
}

class ViewController: UIViewController {
    var cadets : [Cadet] = []
    var index = 0
    var numRecs = 0

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var rankField: UITextField!
    @IBOutlet weak var gpaField: UITextField!
    @IBOutlet weak var squadField: UITextField!
    @IBOutlet weak var dataLabel: UILabel!
    
    @IBAction func doSaveToCloud(sender: AnyObject) {
        let myRecord = CKRecord(recordType: "cadet")
        let aCadet = Cadet(name: nameField.text!, rank: rankField.text!, gpa: Float(gpaField.text!)!, squad: Int(squadField.text!)!)
        let tempData = NSData(data: NSKeyedArchiver.archivedDataWithRootObject(aCadet)) //converts it to a stream of bytes
        myRecord["aCadet"] = tempData as CKRecordValue //the key -- like a dictonary
        CKContainer.defaultContainer().publicCloudDatabase.saveRecord(myRecord){_,_ in} //write the record to the cloud
    }
    
    @IBAction func doRefreshFromCloud(sender: AnyObject) {
        cadets = []
        numRecs = 0
        //building up a query
        let pred = NSPredicate(value: true) //predicate to the query - give me all the records
        let query = CKQuery(recordType: "cadet", predicate: pred)
        let operation = CKQueryOperation(query: query)
        operation.desiredKeys = ["aCadet"]
        operation.resultsLimit = 500
        
        operation.recordFetchedBlock = {record in //for each record we grab
            let myCadetAsArchive = record["aCadet"] as! NSData //the archive means it's a bytestream
            let cadet = (NSKeyedUnarchiver.unarchiveObjectWithData(myCadetAsArchive) as! Cadet)
            cadet.id = record.recordID
            self.cadets.append(cadet)
            self.numRecs += 1
        }
        CKContainer.defaultContainer().publicCloudDatabase.addOperation(operation)
    }
    
    @IBAction func loadHit(sender: AnyObject) {
        dataLabel.text = cadets[0].description
        index = 0 //start at the first guy in the array
    }
    
    @IBAction func nextHit(sender: AnyObject) {
        if index < numRecs - 1{
            index += 1
        }
        dataLabel.text = cadets[index].description
    }
    
    @IBAction func prevHit(sender: AnyObject) {
        if index > 0 {
            index -= 1
        }
        dataLabel.text = cadets[index].description
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}



