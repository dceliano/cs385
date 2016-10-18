//
//  SettingsViewController.swift
//  Pex2_QuizGame
//
//  Created by Dom Celiano on 10/7/16.
//  Copyright © 2016 Dom Celiano. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController{
    @IBOutlet weak var numChoicesBar: UISegmentedControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var africaSwitch: UISwitch!
    @IBOutlet weak var asiaSwitch: UISwitch!
    @IBOutlet weak var eeuSwitch: UISwitch!
    @IBOutlet weak var naSwitch: UISwitch!
    @IBOutlet weak var saSwitch: UISwitch!
    @IBOutlet weak var weuSwitch: UISwitch!
    enum settingErrors : ErrorType {
        case switchError
    }
    var settings = quizSettings() //This value is either passed by `QuizViewController` in `prepareForSegue(_:sender:)' or constructed as part of saving the new settings in the SettingsViewController. I initialize it here to use it in the code.
    
    // MARK : Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (sender as! UIBarButtonItem) == saveButton{
            //save all the settings info in the quizSettings object to be passed back to the quiz after the unwind segue
            do{
                try settings = saveQuizSettings()
            }
            catch{
                let ac = UIAlertController(title: "Error", message: "You did not turn enough switches on for the settings you chose. Please turn on more.", preferredStyle: UIAlertControllerStyle.Alert)
                ac.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(ac, animated: true, completion: nil)
            }
        }
    }
    
    func saveQuizSettings() throws -> quizSettings {
        var newSettings = quizSettings()
        //This is where we read the values on the switches and the UI Segmented Control
        newSettings.num_possibilities = ((numChoicesBar.selectedSegmentIndex + 1) * 3) //Index 0 = 3, Index 1 = 6, Index 2 = 9
        // read the switches below
        newSettings.continents[0].1 = africaSwitch.on
        newSettings.continents[1].1 = asiaSwitch.on
        newSettings.continents[2].1 = eeuSwitch.on
        newSettings.continents[3].1 = naSwitch.on
        newSettings.continents[4].1 = saSwitch.on
        newSettings.continents[5].1 = weuSwitch.on
        //do some error checking here, before we save the new settings
        var num_switches_on = 0
        for i in 0...(newSettings.continents.count - 1){
            if (newSettings.continents[i].1) { num_switches_on += 1 }
        }
        if (num_switches_on == 0 || (newSettings.num_possibilities == 6 && num_switches_on <= 1) || (newSettings.num_possibilities == 9 && num_switches_on <= 2)){
            throw settingErrors.switchError
        }
        return newSettings
    }
    
    func loadUISettings(){
        //This method is executed in the 'prepareForSegue(_:sender:)' method from the QuizViewController. It sets up all the attributes of the switches and the UI Segmented Control based on the Old Settings.
        numChoicesBar.selectedSegmentIndex = (settings.num_possibilities / 3) - 1 //backwards equation from saveQuizSettings() method
        // update the switches below
        africaSwitch.on = settings.continents[0].1
        asiaSwitch.on = settings.continents[1].1
        eeuSwitch.on = settings.continents[2].1
        naSwitch.on = settings.continents[3].1
        saSwitch.on = settings.continents[4].1
        weuSwitch.on = settings.continents[5].1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadUISettings()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
