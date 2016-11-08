//
//  SquadronDetailsViewController.swift
//  PEX3_CadetsWithFriends
//
//  Created by Dom Celiano on 11/6/16.
//  Copyright © 2016 Troy Weingart. All rights reserved.
//

import UIKit

class SquadronDetailsViewController: UIViewController {

    @IBOutlet weak var squadronImageView: UIImageView!
    @IBOutlet weak var squadronNameLabel: UILabel!
    @IBOutlet weak var cqPhoneLabel: UILabel!
    @IBOutlet weak var aocPhoneLabel: UILabel!
    
    var squadron = 1
    var cqPhoneNumber = "333-3444"
    var aocPhoneNumber = "333-1303"
    
    let squadronNames = ["Mach One", "Deuce", "Dogs of War", "Fightin' Fourth", "Wolfpack", "Bull Six", "Shadow Seven", "Eagle Eight", "Viking Nine", "Tiger Ten", "Rebeleven", "Dirty Dozen", "Bulldawgs", "Cobras", "Warhawks", "Chickenhawks", "Stalag", "Nightriders", "Wolverines", "Trolls", "Blackjacks", "Raptors", "Barnstormers", "Phantoms", "Redeye", "Barons", "Thunderbirds", "Blackbirds", "Black Panthers", "Knights of Thirty", "Grim Reapers", "Road Runners", "King Ratz", "Loose Hawgs", "Wild Weasels", "Pink Panthers", "Animalistic Skyraiders", "All-Stars", "Campus Rads", "Warhawks"]
    
    func setupView(){
        cqPhoneLabel.text = self.cqPhoneNumber
        aocPhoneLabel.text = self.aocPhoneNumber
        let squadImage = UIImage(named: "\(String(self.squadron)).gif")
        squadronImageView.image = squadImage
        squadronNameLabel.text = squadronNames[self.squadron - 1]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
