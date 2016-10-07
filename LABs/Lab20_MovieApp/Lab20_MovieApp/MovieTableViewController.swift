//
//  MovieTableTableViewController.swift
//  Lab20_MovieApp
//
//  Created by Troy Weingart on 10/5/16.
//  Copyright © 2016 Troy Weingart. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {
    var myMovies = MovieModel()
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myMovies.data.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell", forIndexPath: indexPath) as! MovieTableViewCell
        cell.movie = myMovies.data[indexPath.row] as MovieModel.Movie
        return cell
    }
}
