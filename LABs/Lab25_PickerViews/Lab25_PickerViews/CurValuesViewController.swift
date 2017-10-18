//
//  CurValuesViewController.swift
//  Lab25_PickerViewsSolution
//
//  Created by Troy Weingart on 10/24/16.
//  Copyright © 2016 Troy Weingart. All rights reserved.
//

import UIKit

class CurValuesViewController: UIViewController {

    @IBOutlet weak var sLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        sLabel.text = (parentViewController as! MyTabBarController).sData
        mLabel.text = (parentViewController as! MyTabBarController).mData
        dateLabel.text = (parentViewController as! MyTabBarController).date
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
