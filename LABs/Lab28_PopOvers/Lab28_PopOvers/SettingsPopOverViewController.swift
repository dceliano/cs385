//
//  SettingsPopOverViewController.swift
//  Lab28_PopOvers
//
//  Created by T6A User on 11/2/16.
//  Copyright © 2016 USAFA. All rights reserved.
//

import UIKit

class SettingsPopOverViewController: UIViewController {

    @IBAction func enterHit(sender: AnyObject) {
        self.doneHit(nil)
    }
    var delegate : ViewController?
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func doneHit(sender: UIButton?) {
        //function call
        delegate?.setName(textField.text!)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textField.becomeFirstResponder()
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
