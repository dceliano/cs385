//
//  ViewController.swift
//  Lsn32_SocialFramework
//
//  Created by Troy Weingart on 11/9/16.
//  Copyright © 2016 Troy Weingart. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {

    @IBOutlet weak var noteTextView: UITextView!
    
    @IBAction func showShareOptions(sender: UIBarButtonItem) {
        let actionSheet = UIAlertController(title: "", message: "Share your Note", preferredStyle: UIAlertControllerStyle.ActionSheet)
        let facebookPostAction = UIAlertAction(title: "Share on Facebook", style: UIAlertActionStyle.Default) { (action) -> Void in
            if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook){
                let facebookComposeVC = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
                facebookComposeVC.setInitialText("\(self.noteTextView.text)")
                self.presentViewController(facebookComposeVC, animated: true, completion: nil)
            }
            else{
                self.showAlertMessage("Sign into facebook in settings")
            }
        }
        let dismissAction = UIAlertAction(title: "Close", style: UIAlertActionStyle.Cancel, handler: nil)
        actionSheet.addAction(facebookPostAction)
        actionSheet.addAction(dismissAction)
        
        presentViewController(actionSheet, animated: true, completion: nil)
    }
    
    func showAlertMessage(message: String!) {
        let alertController = UIAlertController(title: "Lab32_SocialFrameworks", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
        presentViewController(alertController, animated: true, completion: nil)
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

