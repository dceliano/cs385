//
//  QuizViewController.swift
//  Pex2_QuizGame
//
//  Created by Dom Celiano on 10/7/16.
//  Copyright © 2016 Dom Celiano. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController{
    var settings = quizSettings()
    var quizToDisplay = quizViewSettings()
    var myModel = quizModel()
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var topBar: UISegmentedControl!
    @IBOutlet weak var middleBar: UISegmentedControl!
    @IBOutlet weak var bottomBar: UISegmentedControl!
    
    func getNewQuestion(){
        quizToDisplay = myModel.getNewQuestion()
        imageView.image = UIImage(named: quizToDisplay.image_name)
        if(settings.num_possibilities == 3){
            middleBar.removeAllSegments()
            bottomBar.removeAllSegments()
        }
        else if(settings.num_possibilities == 6){
            bottomBar.removeAllSegments()
        }
        else{
            
        }
    }
    
    
    // MARK : Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSettings"{ //if we are about to segue to the SettingsViewController
            let destController = segue.destinationViewController as! SettingsViewController
            destController.settings = settings //pass the old settings
        }
    }
    @IBAction func unwindToQuiz(sender: UIStoryboardSegue){
        if let sourceViewController = sender.sourceViewController as? SettingsViewController{
            //the sourceViewController is downcast to where the segue is coming from (i.e. an unwind segue from SettingsViewController)
            //THIS IS WHERE THE QUIZ SETTINGS WOULD GET UPDATED
            settings = sourceViewController.settings
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.getNewQuestion() //start a game to get going
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}