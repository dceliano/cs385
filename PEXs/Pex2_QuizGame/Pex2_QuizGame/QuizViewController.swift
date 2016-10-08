//
//  QuizViewController.swift
//  Pex2_QuizGame
//
//  Created by Dom Celiano on 10/7/16.
//  Copyright © 2016 Dom Celiano. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController{
    var settings = quizSettings() //initialize the settings for when the quiz starts
    
    // MARK : Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSettings"{ //if we are about to segue to the SettingsViewController
            let destController = segue.destinationViewController as! SettingsViewController
            destController.settings = settings //pass the old settings
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToQuiz(sender: UIStoryboardSegue){
        if let sourceViewController = sender.sourceViewController as? SettingsViewController{
            //the sourceViewController is downcast to where the segue is coming from (i.e. an unwind segue from SettingsViewController)
            //THIS IS WHERE THE QUIZ SETTINGS WOULD GET UPDATED
            settings = sourceViewController.settings
        }
    }
}