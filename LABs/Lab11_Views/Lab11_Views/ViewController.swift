//
//  ViewController.swift
//  Lab11_Views
//
//  Created by T6A User on 9/13/16.
//  Copyright © 2016 USAFA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let mainview = self.view
        var v1 = UIView(frame:CGRectMake(113, 111, 132, 194))
        v1.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 1)
        let v2 = UIView(frame:CGRectMake(41, 56, 132, 194))
        v2.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
        let v3 = UIView(frame:CGRectMake(43, 197, 160, 230))
        v3.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        mainview.addSubview(v1)
        v1.addSubview(v2)
        mainview.addSubview(v3)
        //v1.frame.origin = CGPoint(x: 163, y: 161)
        //v1.frame.size = CGSize(width: 182, height: 244)
        v1 = UIView(frame:CGRectMake(163, 161, 182, 244))
        mainview.addSubview(v1)
        v1.addSubview(v2)
        mainview.addSubview(v3)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

