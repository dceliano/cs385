//
//  DateViewController.swift
//  Lab25_Pickers
//
//  Created by Troy Weingart on 10/22/16.
//  Copyright © 2016 madapps. All rights reserved.
//

import UIKit

class DateViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBAction func dateChanged(sender: AnyObject) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let strDate = dateFormatter.stringFromDate(sender.date)
        (tabBarController as! MyTabBarController).date = "\(strDate)"
        dateLabel.text = strDate
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
