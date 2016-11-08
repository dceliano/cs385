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
    
    @IBOutlet weak var squadronImageButton: SquadronPickerButton!
    
    @IBAction func squadronImageButtonPressed(sender: AnyObject) {
        
    }
    
    var friend: FriendModel.Friend! {
        didSet {
            self.nameLabel.text = "\(friend.firstname) \(friend.lastname)"
            self.birthdayLabel.text = friend.birthday
            //BELOW IS WHERE THE RANK IMAGES WILL BE SWITCHED AROUND TO THEIR CORRECT NAMES - WHAT IS BELOW IS TEMPORARY
            self.rankImageView.image = UIImage(named: "rank 1-1.jpg")
            let squadImage = UIImage(named: "\(String(friend.squadron)).gif")
            self.squadronImageButton.setImage(squadImage, forState: UIControlState.Normal)
            //self.squadronImageButton.setImage(UIImage(named: "\(String(friend.squadron)).gif"), forState: UIControlState.Normal)

        }
    }

}
