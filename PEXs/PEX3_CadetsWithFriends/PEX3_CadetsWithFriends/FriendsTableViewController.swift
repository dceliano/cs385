//
//  FriendsTableViewController.swift
//  PEX3_CadetsWithFriends
//
//  Created by Dom Celiano on 11/6/16.
//  Copyright © 2016 Troy Weingart. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    enum mode {
        case add, edit
    }
    
    var myFriends = FriendModel()
    var selectedRow = 0
    
    @IBAction func saveFriendDetail(segue:UIStoryboardSegue) {
        if let refTo = segue.sourceViewController as? FriendDetailsTableViewController {
            if refTo.mode == .add {
                myFriends.data.append(refTo.friend)
            } else {
                myFriends.data[selectedRow] = refTo.friend
            }
            tableView.reloadData()
            myFriends.writeData()
        }
    }
    @IBAction func cancelToFriendTableViewController(segue:UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}