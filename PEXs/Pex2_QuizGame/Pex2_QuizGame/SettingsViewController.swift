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
    var settings = quizSettings() //This value is either passed by `QuizViewController` in `prepareForSegue(_:sender:)' or constructed as part of saving the new settings in the SettingsViewController. I initialize it here to use it in the code.
    
    // MARK : Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (sender as! UIBarButtonItem) == saveButton{
            //save all the settings info in the quizSettings object to be passed back to the quiz after the unwind segue
            settings = saveQuizSettings()
        }
    }
    
    func saveQuizSettings() -> quizSettings{
        var newSettings = quizSettings()
        //This is where we read the values on the switches and the UI Segmented Control
        newSettings.num_possibilities = ((numChoicesBar.selectedSegmentIndex + 1) * 3) //Index 0 = 3, Index 1 = 6, Index 2 = 9
        // read the switches below
        newSettings.continents["africa"] = africaSwitch.on
        newSettings.continents["asia"] = asiaSwitch.on
        newSettings.continents["eeu"] = eeuSwitch.on
        newSettings.continents["na"] = naSwitch.on
        newSettings.continents["sa"] = saSwitch.on
        newSettings.continents["weu"] = weuSwitch.on
        return newSettings
    }
    
    func loadUISettings(){
        //This method is executed in the 'prepareForSegue(_:sender:)' method from the QuizViewController. It sets up all the attributes of the switches and the UI Segmented Control based on the Old Settings.
        numChoicesBar.selectedSegmentIndex = (settings.num_possibilities / 3) - 1 //backwards equation from saveQuizSettings() method
        // update the switches below
        africaSwitch.on = settings.continents["africa"]!
        asiaSwitch.on = settings.continents["asia"]!
        eeuSwitch.on = settings.continents["eeu"]!
        naSwitch.on = settings.continents["na"]!
        saSwitch.on = settings.continents["sa"]!
        weuSwitch.on = settings.continents["weu"]!
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
