//
//  Movie.swift
//  Lab20_MovieApp
//
//  Created by Troy Weingart on 10/5/16.
//  Copyright © 2016 Troy Weingart. All rights reserved.
//

import UIKit

struct MovieModel : CustomStringConvertible {
    
    class Movie : NSObject, NSCoding {
        
        var title: String?
        var director: String?
        var rating: Int
        var releaseYear : Int
        var studio : String?
        
        override var description: String {
            return "Title: \(self.title!)\nDirector: \(self.director!)\nRating:\(self.rating)\nRelease:" +
                "\(self.releaseYear)\nStudio: \(self.studio!)"
        }
        
        init(title: String?, director: String?, rating: Int, releaseYear: Int, studio: String?) {
            self.title = title
            self.director = director
            self.rating = rating
            self.releaseYear = releaseYear
            self.studio = studio
        }
        
        // this function is required by the NSCoding protocol
        func encodeWithCoder(coder: NSCoder) {
            coder.encodeObject(self.title, forKey: "title") // encodes an object any string is allowed
            coder.encodeObject(self.director, forKey:  "director")
            coder.encodeObject(self.rating, forKey:  "rating")
            coder.encodeObject(self.releaseYear, forKey:  "releaseYear")
            coder.encodeObject(self.studio, forKey:  "studio")
        }
        
        // also required by the NSCoding protocol
        required init(coder : NSCoder) {
            self.title = (coder.decodeObjectForKey("title") as! String) //decodes the object as a String
            self.director = (coder.decodeObjectForKey("director") as! String)
            self.rating = (coder.decodeObjectForKey("rating") as! Int)
            self.releaseYear = (coder.decodeObjectForKey("releaseYear") as! Int)
            self.studio = (coder.decodeObjectForKey("studio") as! String)
            super.init() // I called this to ensure that any initialization done in NSObject and NSCoding are also done
        }
    }
    
    init() {
        // check if the key "movies" is already in NSUserDefaults. if not it will return nil
        let myMovieAsArchive = NSUserDefaults.standardUserDefaults().objectForKey("movie")
        if myMovieAsArchive != nil {
            // there is already an entry "persons" in defaults
            data = NSKeyedUnarchiver.unarchiveObjectWithData(myMovieAsArchive as! NSData) as! [Movie]  // note the downcasts
            
        } else {
            // there isn't an entry in the defaults database e.g. first run of app or a reinstall of the app
            let tempData = NSData(data: NSKeyedArchiver.archivedDataWithRootObject(data))
            NSUserDefaults.standardUserDefaults().setObject(tempData, forKey: "persons")
            
        }
    }
    
    var data = [
        Movie(title: "True Lies", director: "Iam Stract", rating: 3, releaseYear: 1999, studio: "Sony"),
        Movie(title: "Predator", director: "Too L. Shed", rating: 2, releaseYear: 2000, studio: "WB"),
        Movie(title: "Terminator", director: "Do Lee", rating: 4, releaseYear: 2012, studio: "Disney")]
    
    var description: String {
        var str = ""
        var mNum = 0
        for movie in data {
            str += "\(mNum) \(movie.description) \n"
            mNum += 1
        }
        return str
    }
    func saveData() {
        let tempData = NSData(data: NSKeyedArchiver.archivedDataWithRootObject(data))
        NSUserDefaults.standardUserDefaults().setObject(tempData, forKey: "data")
    }
}