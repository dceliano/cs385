//
//  MovieDetailsTableViewController.swift
//  Lab20_MovieApp
//
//  Created by Troy Weingart on 10/6/16.
//  Copyright © 2016 Troy Weingart. All rights reserved.
//

import UIKit

class MovieDetailsTableViewController: UITableViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var directorTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var studioTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var movie = MovieModel.Movie(title: "", director: "", rating: 1, releaseYear: 0, studio: "")
    var mode : MovieTableViewController.mode?
    
    @IBAction func starSelected(segue:UIStoryboardSegue){
        if let starViewController = segue.sourceViewController as? StarViewController{
            movie.rating = starViewController.rating
            imageView.image = UIImage(named: "\(movie.rating)Stars")
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SaveMovieDetail"{
            movie.title = titleTextField.text
            movie.director = directorTextField.text
            movie.releaseYear = Int(yearTextField.text!)!
            movie.studio = studioTextField.text
        }
    }
}
