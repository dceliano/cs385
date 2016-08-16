//
//  ViewController.swift
//  Lab02_Hello
//
//  Created by T6A User on 8/16/16.
//  Copyright © 2016 USAFA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameEntry: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameEntry.text="This is a test."
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

