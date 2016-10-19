//
//  MovieTableViewCell.swift
//  Lab20_MovieApp
//
//  Created by Troy Weingart on 10/6/16.
//  Copyright © 2016 Troy Weingart. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    
    var movie : MovieModel.Movie!{
        didSet { //this runs if something gets set, and updates the labels
            titleLabel.text = movie.title
            directorLabel.text = movie.director
            ratingImageView.image = UIImage(named: "\(movie.rating)Stars")
        }
    }
}
