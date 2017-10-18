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
    
    @IBAction func showShareOptions(_ sender: UIBarButtonItem) {
        let actionSheet = UIAlertController(title: "", message: "Share your Note", preferredStyle: UIAlertControllerStyle.actionSheet)
        let facebookPostAction = UIAlertAction(title: "Share on Facebook", style: UIAlertActionStyle.default) { (action) -> Void in
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook){
                let facebookComposeVC = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
                facebookComposeVC?.setInitialText("\(self.noteTextView.text)")
                self.present(facebookComposeVC!, animated: true, completion: nil)
            }
            else{
                self.showAlertMessage("Sign into facebook in settings")
            }
        }
        let dismissAction = UIAlertAction(title: "Close", style: UIAlertActionStyle.cancel, handler: nil)
        actionSheet.addAction(facebookPostAction)
        actionSheet.addAction(dismissAction)
        
        present(actionSheet, animated: true, completion: nil)
    }
    
    func showAlertMessage(_ message: String!) {
        let alertController = UIAlertController(title: "Lab32_SocialFrameworks", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
        present(alertController, animated: true, completion: nil)
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

