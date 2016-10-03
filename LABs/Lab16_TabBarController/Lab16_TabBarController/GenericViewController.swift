//
//  GenericViewController.swift
//  Lab16_TabBarController
//
//  Created by Troy Weingart on 9/26/16.
//  Copyright © 2016 Troy Weingart. All rights reserved.
//

import UIKit

class GenericViewController: UIViewController {

    @IBAction func incrementFirstCount(sender: UIButton) {
        (parentViewController as! CountingTabBarController).firstCount += 1
        updateBadge()
        updateCounts()
    }
    @IBAction func incrementSecondCount(sender: UIButton) {
        (parentViewController as! CountingTabBarController).secondCount += 1
        updateBadge()
        updateCounts()
    }
    @IBAction func incrementThirdCount(sender: UIButton) {
        (parentViewController as! CountingTabBarController).thirdCount += 1
        updateBadge()
        updateCounts()
    }
        func updateCounts() {
            let first=(parentViewController as!
                CountingTabBarController).firstCount
            let second=(parentViewController as!
                CountingTabBarController).secondCount
            let third=(parentViewController as!
                CountingTabBarController).thirdCount
            self.outputLabel.text =
                "First: \(first) \nSecond: \(second) \nThird: \(third)"
        }
    
        func updateBadge() {
            var badgeCount: Int
            if (barItem.badgeValue != nil) {
                badgeCount = Int(barItem.badgeValue!)!
                badgeCount += 1
                barItem.badgeValue = String(badgeCount)
            } else {
                barItem.badgeValue = "1"
            }
        }
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var barItem: UITabBarItem!
    
    override func viewWillAppear(animated: Bool) {
        updateCounts()
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



