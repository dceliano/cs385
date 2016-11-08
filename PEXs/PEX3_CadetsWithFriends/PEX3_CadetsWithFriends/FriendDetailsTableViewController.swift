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
    
    var friend = FriendModel.Friend(firstname: "", lastname: "", squadron: 01, rank: "", birthday: "", notes: "") //initialize a blank friend
    var mode : FriendsTableViewController.mode? //check if we are editing an entry or adding a new entry
    
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
            self.title = "Edit Friend Info"
        }
        super.viewDidLoad()
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        //these conditions get checked automatically when we try to segue
        if(identifier == "saveFriendDetail"){
            if (firstnameTextField.text == "" || lastnameTextField.text == "" || (navigationController as! NewFriendNavigationController).date == "" || (navigationController as! NewFriendNavigationController).squadronSelected == 0 || (navigationController as! NewFriendNavigationController).rankData == ""){
                let ac = UIAlertController(title: "Error", message: "You did not fill out all the fields. Please note that the notes field is optional.", preferredStyle: UIAlertControllerStyle.Alert)
                ac.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(ac, animated: true, completion: nil)
                return false //we should not perform this segue
            }
            else{
                return true
            }
        }
        else{
            return true
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "saveFriendDetail" { //get the details from the text fields right before we save our settings
            friend.firstname = firstnameTextField.text
            friend.lastname = lastnameTextField.text
            friend.notes = notesTextField.text
            friend.birthday = (navigationController as! NewFriendNavigationController).date
            friend.squadron = (navigationController as! NewFriendNavigationController).squadronSelected
            friend.rank = (navigationController as! NewFriendNavigationController).rankData
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}