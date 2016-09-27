//
//  CountingNavController.swift
//  Lab16_NavController
//
//  Created by T6A User on 9/27/16.
//  Copyright © 2016 Troy Weingart. All rights reserved.
//

import UIKit

class CountingNavController: UINavigationController {

    var pushcount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
