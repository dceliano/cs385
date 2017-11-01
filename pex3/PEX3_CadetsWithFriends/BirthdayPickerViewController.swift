//
//  DatePickerViewController.swift
//  PEX3_CadetsWithFriends
//
//  Created by Dom Celiano on 11/6/16.
//  Copyright © 2016 Troy Weingart. All rights reserved.
//

import UIKit

class BirthdayPickerViewController: UIViewController {
    @IBAction func dateChanged(sender: AnyObject) {
        //get the date info working
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let strDate = dateFormatter.stringFromDate(sender.date)
        (navigationController as! NewFriendNavigationController).date = "\(strDate)"
        let nav = navigationController as! NewFriendNavigationController
        (nav.viewControllers.first as! FriendDetailsTableViewController).updateBirthdayLabel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //pickerView.delegate = self
        //pickerView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

