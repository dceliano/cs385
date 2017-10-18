//
//  ViewController.swift
//  Lab28_PopOvers
//
//  Created by T6A User on 11/2/16.
//  Copyright © 2016 USAFA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    @IBOutlet weak var nameLabel: UILabel!

    func setName(name: String){
        nameLabel.text = "Name Entered = " + name
    }
    
    @IBAction func settingsHit(sender: UIBarButtonItem) {
        let VC = storyboard?.instantiateViewControllerWithIdentifier("Settings") as! SettingsPopOverViewController
        VC.delegate = self
        VC.preferredContentSize = CGSize(width: 250, height: 100)
        VC.modalPresentationStyle = .Popover
        VC.popoverPresentationController?.delegate = self
        VC.popoverPresentationController?.barButtonItem = sender
        presentViewController(VC, animated: true, completion: nil)
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

