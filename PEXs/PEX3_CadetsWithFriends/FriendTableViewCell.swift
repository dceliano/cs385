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

    var friend: FriendModel.Friend! {
        didSet {
            self.nameLabel.text = "\(friend.firstname!) \(friend.lastname!)"
            self.birthdayLabel.text = friend.birthday
            //BELOW IS WHERE THE RANK IMAGES ARE SWITCHED TO THEIR CORRECT IMAGE NAMES
            var final_image_name = ""
            switch friend.rank!{
            case "C/Wing CC":
                final_image_name = "rank 1-0.jpg"
            case "C/Wing VC":
                final_image_name = "rank 1-1.jpg"
            case "C/Col":
                final_image_name = "rank 1-2.jpg"
            case "C/Sq CC":
                final_image_name = "rank 1-3.jpg"
            case "C/Lt Col":
                final_image_name = "rank 1-4.jpg"
            case "C/Maj":
                final_image_name = "rank 1-5.jpg"
            case "C/Flt CC":
                final_image_name = "rank 1-6.jpg"
            case "C/Capt CC":
                final_image_name = "rank 1-7.jpg"
            case "C/1st Lt":
                final_image_name = "rank 1-8.jpg"
            case "C/2d Lt":
                final_image_name = "rank 1-9.jpg"
            case "Unranked1":
                final_image_name = "rank 1-10.jpg"
            case "C/CMSgt":
                final_image_name = "rank 2-0.jpg"
            case "C/Group Supt":
                final_image_name = "rank 2-1.jpg"
            case "C/Squad Supt":
                final_image_name = "rank 2-2.jpg"
            case "C/SMSgt":
                final_image_name = "rank 2-3.jpg"
            case "C/First Sgt":
                final_image_name = "rank 2-4.jpg"
            case "C/MSgt":
                final_image_name = "rank 2-5.jpg"
            case "C/TSgt":
                final_image_name = "rank 2-6.jpg"
            case "Unranked2":
                final_image_name = "rank 2-7.jpg"
            case "C/SSgt":
                final_image_name = "rank 3-0.jpg"
            case "Unranked3":
                final_image_name = "rank 3-1.jpg"
            case "C/Amn":
                final_image_name = "rank 4-0.jpg"
            default:
                final_image_name = "rank 1-1.jpg"
            }
            self.rankImageView.image = UIImage(named: final_image_name)
            let squadImage = UIImage(named: "\(String(friend.squadron)).gif")
            self.squadronImageButton.setImage(squadImage, forState: UIControlState.Normal)
        }
    }

}
