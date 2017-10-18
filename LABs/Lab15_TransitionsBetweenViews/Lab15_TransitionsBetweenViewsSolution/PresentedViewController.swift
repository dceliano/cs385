//
//  PresentedViewController.swift
//  Lab15_TransitionsBetweenViews
//
//  Created by T6A User on 9/23/16.
//  Copyright © 2016 Troy Weingart. All rights reserved.
//

import UIKit

protocol PresentedVCDelegate: class{
    //list the methods and properties which are required
    func acceptMessage(mesg: String)
}

class PresentedViewController: UIViewController {

    var message = ""
    var delegate : PresentedVCDelegate?
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBAction func doDismiss(sender: AnyObject) {
        //(self.presentingViewController as! ViewController).updateLabel("From presented")
        delegate?.acceptMessage("From presented")
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        statusLabel.text = message
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
