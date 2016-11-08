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
    
    func sortFriends(){
        myFriends = (tabBarController as! MyTabBarController).myFriends //load the friend data
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        myFriends.data.sortInPlace{ dateFormatter.dateFromString($0.birthday!)!.compare(dateFormatter.dateFromString($1.birthday!)!) == .OrderedAscending } //will compare NSDates and sort dates in ascending order (oldest person first)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.sortFriends()
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
