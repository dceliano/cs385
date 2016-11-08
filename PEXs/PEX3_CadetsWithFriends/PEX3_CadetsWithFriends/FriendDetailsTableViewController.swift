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
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var squadronLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    
    var friend = FriendModel.Friend(firstname: "", lastname: "", squadron: 01, rank: "", birthday: "", notes: "")
    var mode : FriendsTableViewController.mode? //check if we are editing an entry
    
    func updateBirthdayLabel(){
        birthdayLabel.text = (navigationController as! NewFriendNavigationController).date
    }
    func updateRankLabel(){
        rankLabel.text = (navigationController as! NewFriendNavigationController).rankData
    }
    func updateSquadronLabel(){
        squadronLabel.text = String((navigationController as! NewFriendNavigationController).squadronSelected)
    }
    
    override func viewDidLoad() {
        if self.mode == .edit {
            firstnameTextField.text = friend.firstname
            lastnameTextField.text = friend.lastname
            notesTextField.text = friend.notes
            squadronLabel.text = String(friend.squadron)
            rankLabel.text = friend.rank
            birthdayLabel.text = friend.birthday
        }
        super.viewDidLoad()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SaveFriendDetail" {
            friend.firstname = firstnameTextField.text
            friend.lastname = lastnameTextField.text
            friend.notes = notesTextField.text
            friend.squadron = (navigationController as! NewFriendNavigationController).squadronSelected
            friend.rank = (navigationController as! NewFriendNavigationController).rankData
            self.viewDidLoad()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}