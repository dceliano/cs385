//
//  FriendTableViewCell.swift
//  PEX3_CadetsWithFriends
//
//  Created by Dom Celiano on 11/6/16.
//  Copyright © 2016 Troy Weingart. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var rankImageView: UIImageView!
    @IBOutlet weak var squadronImageButton: UIButton!
    
    @IBAction func squadronButtonPressed(sender: AnyObject) {
    }
    
    var friend: FriendModel.Friend! {
        didSet {
            self.nameLabel.text = "\(friend.firstname) \(friend.lastname)"
            self.birthdayLabel.text = friend.birthday
            //BELOW IS WHERE THE RANK IMAGES WILL BE SWITCHED AROUND TO THEIR CORRECT NAMES - WHAT IS BELOW IS TEMPORARY
            //self.rankImageView.image = UIImage(named: "rank 1-1")
            //self.squadronImageButton.setImage(UIImage(named: String(friend.squadron)), forState: UIControlState.Normal)
        }
    }

}
