//
//  BirthdayTableViewController.swift
//  PEX3_CadetsWithFriends
//
//  Created by Dom Celiano on 11/6/16.
//  Copyright © 2016 Troy Weingart. All rights reserved.
//

import UIKit

class BirthdayTableViewController: UITableViewController {
    var myFriends = FriendModel()
    
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
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nav = segue.destinationViewController as! UINavigationController
        if segue.identifier == "editSegue" {
            (nav.topViewController as! FriendDetailsTableViewController).mode = .edit
            (nav.topViewController as! FriendDetailsTableViewController).friend = (sender as!FriendTableViewCell).friend
            selectedRow = (tableView.indexPathForSelectedRow?.row)!
        }
        else if segue.identifier == "showSquadronDetails"{
            //(nav.topViewController as! SquadronDetailsViewController).squadron = (navigationController as! FriendsNavController).squadronDetailsToView //THIS SHOULD BE FIXED
            (nav.topViewController as! SquadronDetailsViewController).squadron = 7
        }
        else { // AddMode
            (nav.topViewController as! FriendDetailsTableViewController).mode = .add
        }
    }
    
    override func viewDidLoad() {
        myFriends = (tabBarController as! MyTabBarController).myFriends //load the friend data
        myFriends.data.sortInPlace{$0.birthday < $1.birthday} //will sort dates in ascending order (oldest person first)
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
