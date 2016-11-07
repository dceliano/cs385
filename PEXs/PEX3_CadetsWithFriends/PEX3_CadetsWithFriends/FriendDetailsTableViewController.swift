//
//  FriendDetailsTableViewController.swift
//  PEX3_CadetsWithFriends
//
//  Created by Dom Celiano on 11/6/16.
//  Copyright © 2016 Troy Weingart. All rights reserved.
//

import UIKit

class FriendDetailsTableViewController: UITableViewController {
    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var notesTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    
    var friend = FriendModel.Friend(firstname: "", lastname: "", squadron: 01, rank: "", birthday: "", notes: "")
    var mode : FriendsTableViewController.mode? //are we editing an entry?
    
    override func viewDidLoad() {
        if self.mode == .edit {
            firstnameTextField.text = friend.firstname
            lastnameTextField.text = friend.lastname
            self.title = "Add Friend Info"
        }
        super.viewDidLoad()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SaveFriendDetail" {
            friend.firstname = firstnameTextField.text
            friend.lastname = lastnameTextField.text
            friend.notes = notesTextField.text
            friend.squadron = (navigationController as! NewFriendNavigationController).squadronSelected
            friend.rank = (navigationController as! NewFriendNavigationController).rankData //CHANGE THE WAY THIS GETS LOADED IN
            //save other details here
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}