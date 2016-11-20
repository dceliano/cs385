//
//  SettingsViewController.swift
//  Pex2_QuizGame
//
//  Created by Dom Celiano on 10/7/16.
//  Copyright © 2016 Dom Celiano. All rights reserved.
//

import UIKit

protocol PresentedVCDelegate: class{
    //list the methods and properties which are required
    func acceptNewSettings(_ newSettings : quizSettings)
}

class SettingsViewController: UIViewController{
    @IBOutlet weak var numChoicesBar: UISegmentedControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var africaSwitch: UISwitch!
    @IBOutlet weak var asiaSwitch: UISwitch!
    @IBOutlet weak var eeuSwitch: UISwitch!
    @IBOutlet weak var naSwitch: UISwitch!
    @IBOutlet weak var saSwitch: UISwitch!
    @IBOutlet weak var weuSwitch: UISwitch!
    enum settingErrors : Error {
        case switchError
    }
    var settings = quizSettings() //This value is either passed by `QuizViewController` in `prepareForSegue(_:sender:)' or constructed as part of saving the new settings in the SettingsViewController. I initialize it here to use it in the code.
    
    // MARK : Navigation
    var delegate : PresentedVCDelegate?
    
    @IBAction func saveSettings(){
        //save all the settings info in the quizSettings object to be passed back to the quiz
        do{
            try delegate?.acceptNewSettings(saveQuizSettings())
            self.navigationController?.popViewController(animated: true) //dismiss the settings view controller
        }
        catch{
            let ac = UIAlertController(title: "Error", message: "You did not turn on enough switches. Please turn on more.", preferredStyle: UIAlertControllerStyle.alert)
            ac.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
            self.present(ac, animated: true, completion: nil)
        }
    }
    
    func saveQuizSettings() throws -> quizSettings {
        var newSettings = quizSettings()
        //This is where we read the values on the switches and the UI Segmented Control
        newSettings.num_possibilities = ((numChoicesBar.selectedSegmentIndex + 1) * 3) //Index 0 = 3, Index 1 = 6, Index 2 = 9
        // read the switches below
        newSettings.continents[0].1 = africaSwitch.isOn
        newSettings.continents[1].1 = asiaSwitch.isOn
        newSettings.continents[2].1 = eeuSwitch.isOn
        newSettings.continents[3].1 = naSwitch.isOn
        newSettings.continents[4].1 = saSwitch.isOn
        newSettings.continents[5].1 = weuSwitch.isOn
        //do some error checking here, before we save the new settings
        var num_switches_on = 0
        for i in 0...(newSettings.continents.count - 1){
            if (newSettings.continents[i].1) { num_switches_on += 1 }
        }
        if (num_switches_on == 0 || (newSettings.num_possibilities >= 6 && num_switches_on <= 1)){
            throw settingErrors.switchError
        }
        return newSettings
    }
    
    func loadUISettings(){
        //This method is executed in the 'prepareForSegue(_:sender:)' method from the QuizViewController. It sets up all the attributes of the switches and the UI Segmented Control based on the Old Settings.
        numChoicesBar.selectedSegmentIndex = (settings.num_possibilities / 3) - 1 //backwards equation from saveQuizSettings() method
        // update the switches below
        africaSwitch.isOn = settings.continents[0].1
        asiaSwitch.isOn = settings.continents[1].1
        eeuSwitch.isOn = settings.continents[2].1
        naSwitch.isOn = settings.continents[3].1
        saSwitch.isOn = settings.continents[4].1
        weuSwitch.isOn = settings.continents[5].1
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
