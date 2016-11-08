//
//  MyTabBarController.swift
//  PEX3_CadetsWithFriends
//
//  Created by Dom Celiano on 11/8/16.
//  Copyright © 2016 Troy Weingart. All rights reserved.
//

//DOCUMENTATION: No help was received, although I used Google/Stack Overflow to troubleshoot many errors and I heavily referenced the movie app lab solution by Lt Col Weingart (Lab 23).

import UIKit

class MyTabBarController: UITabBarController {

    var myFriends = FriendModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
