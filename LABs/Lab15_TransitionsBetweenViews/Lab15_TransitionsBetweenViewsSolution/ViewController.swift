//
//  ViewController.swift
//  Lab15_TransitionsBetweenViewsSolution
//
//  Created by Troy Weingart on 9/23/16.
//  Copyright © 2016 Troy Weingart. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PresentedVCDelegate {

    
    @IBOutlet weak var statusLabel: UILabel!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        (segue.destinationViewController as! SegueViewController).message = "From Root View"
    }
    
    @IBAction func doUnwind(seg: UIStoryboardSegue!){
        
    }
    
    func acceptMessage(mesg: String){
        statusLabel.text = mesg
    }
    
    @IBAction func doPresent(sender: AnyObject) {
        let pvc = PresentedViewController()
        pvc.message = "from root"
        pvc.modalTransitionStyle = .FlipHorizontal //what the cool kids do'
        pvc.delegate = self
        self.presentViewController(pvc, animated: true, completion: nil)
        
    }
    @IBAction func doSegue(sender: AnyObject) {
        self.performSegueWithIdentifier("mySegue", sender: self)
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

