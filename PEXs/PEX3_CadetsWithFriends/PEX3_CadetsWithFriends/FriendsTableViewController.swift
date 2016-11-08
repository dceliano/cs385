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
    var squadronButtonPressed = 1
    
    //These 3 functions below are part of the table view.
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myFriends.data.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FriendCell", forIndexPath: indexPath) as! FriendTableViewCell
        cell.friend = myFriends.data[indexPath.row] as FriendModel.Friend
        cell.squadronImageButton.squadron = cell.friend.squadron
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nav = segue.destinationViewController as! UINavigationController
        if segue.identifier == "editSegue" {
            (nav.topViewController as! FriendDetailsTableViewController).mode = .edit
            (nav.topViewController as! FriendDetailsTableViewController).friend = (sender as! FriendTableViewCell).friend
            selectedRow = (tableView.indexPathForSelectedRow?.row)!
        }
        else if segue.identifier == "showSquadronDetails"{ //show squadron details mode
            (nav.topViewController as! SquadronDetailsViewController).squadron = (sender as! SquadronPickerButton).squadron
        }
        else { // AddMode
            (nav.topViewController as! FriendDetailsTableViewController).mode = .add
        }
    }
    
    override func viewDidLoad() {
        (tabBarController as! MyTabBarController).myFriends = myFriends //pass all of the friends back to the root controller
    }
    
    @IBAction func saveFriendDetail(segue:UIStoryboardSegue) {
        if let refTo = segue.sourceViewController as? FriendDetailsTableViewController { //if we are seguing from a FriendDetailsTableViewController
            if refTo.mode == .add {
                myFriends.data.append(refTo.friend)
            } else {
                myFriends.data[selectedRow] = refTo.friend
            }
            tableView.reloadData()
            myFriends.writeData()
            (tabBarController as! MyTabBarController).myFriends = myFriends
        }
    }
    @IBAction func cancelToFriendTableViewController(segue:UIStoryboardSegue) {
    }
}