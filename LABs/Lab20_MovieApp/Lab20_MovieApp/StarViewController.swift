//
//  StarViewController.swift
//  MovieApp
//
//  Created by administrator on 10/7/14.
//  Copyright (c) 2014 administrator. All rights reserved.
//

import UIKit

class StarViewController: UIViewController {
    var rating = 1 //temporary
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.rating = sender!.tag
    }
}
