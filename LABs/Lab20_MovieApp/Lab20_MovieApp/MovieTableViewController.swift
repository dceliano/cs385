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
    enum mode{
        case add, edit
    }
    var selectedRow = 0
    
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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "EditSegue"{
            (segue.destinationViewController as! MovieDetailsTableViewController).movie = (sender as! MovieTableViewCell).movie
            (segue.destinationViewController as! MovieDetailsTableViewController).mode = .edit
            selectedRow = (tableView.indexPathForSelectedRow?.row)!
        }
        else{ //AddMode
            (segue.destinationViewController as! MovieDetailsTableViewController).mode = .add
        }
    }
    
    @IBAction func cancelToMovieViewController(segue:UIStoryboardSegue){
    }
    @IBAction func saveMovieDetail(segue:UIStoryboardSegue){
        let refTo = segue.sourceViewController as! MovieDetailsTableViewController
        let movie = refTo.movie
        if refTo.mode == .add{
            myMovies.data.append(movie)
        }
        else{
            myMovies.data[selectedRow] = movie
        }
        tableView.reloadData()
    }
}
