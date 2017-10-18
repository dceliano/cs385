//
//  Movie.swift
//  Lab20_MovieApp
//
//  Created by Troy Weingart on 10/5/16.
//  Copyright © 2016 Troy Weingart. All rights reserved.
//

import UIKit

struct MovieModel : CustomStringConvertible {
    
    struct Movie : CustomStringConvertible {
        
        var title: String?
        var director: String?
        var rating: Int
        var releaseYear : Int
        var studio : String?
        
        var description: String {
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
}