//
//  FriendDetailsTableViewController.swift
//  PEX3_CadetsWithFriends
//
//  Created by Dom Celiano on 11/6/16.
//  Copyright © 2016 Troy Weingart. All rights reserved.
//

import UIKit

class FriendDetailsTableViewController: UITableViewController {
    //@IBOutlet weak var notesTextField: UITextField!
    //@IBOutlet weak var firstnameTextField: UITextField!
    //@IBOutlet weak var surnameTextField: UITextField!
    
    var friend = FriendModel.Friend(firstname: "", lastname: "", squadron: 1, rank: "")
    var mode : FriendsTableViewController.mode?
    
    override func viewDidLoad() {
//        if self.mode == .edit {
//            firstnameTextField.text = friend.firstname
//            surnameTextField.text = friend.lastname
//            self.title = "Add Friend Info"
//        }
        super.viewDidLoad()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SaveFriendDetail" {
            //friend.firstname = firstnameTextField.text
            //friend.lastname = surnameTextField.text
            //save other details here
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}