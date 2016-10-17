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
    var questionToDisplay = quizViewSettings()
    var myModel = quizModel()
    var guess_correct = false
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var topBar: UISegmentedControl!
    @IBOutlet weak var middleBar: UISegmentedControl!
    @IBOutlet weak var bottomBar: UISegmentedControl!
    @IBAction func topBarPressed(sender: AnyObject) {
        barPressed(0, offset: topBar.selectedSegmentIndex)
    }
    @IBAction func middleBarPressed(sender: AnyObject) {
        barPressed(3, offset: middleBar.selectedSegmentIndex)
    }
    @IBAction func bottomBarPressed(sender: AnyObject) {
        barPressed(6, offset: bottomBar.selectedSegmentIndex)
    }
    func barPressed(barStartIndex: Int, offset: Int){
        guess_correct = self.myModel.makeGuess(barStartIndex + offset)
        if(guess_correct){
            self.getNewQuestion()
        }
    }
    
    func getNewQuestion(){
        questionToDisplay = myModel.getNewQuestion()
        imageView.image = UIImage(named: questionToDisplay.image_name)
        self.updateChoiceBars()
    }
    
    func updateChoiceBars(){
        //We will remove all of the choices, and then rebuild them
        topBar.removeAllSegments()
        middleBar.removeAllSegments()
        bottomBar.removeAllSegments()
        if(settings.num_possibilities >= 3){ //start building from the first (top) row
            for i in 0...2{
                topBar.insertSegmentWithTitle(self.myModel.questionToDisplay.choices[i], atIndex: i % 3, animated: false)
            }
        }
        if(settings.num_possibilities >= 6){
            for i in 3...5{
                middleBar.insertSegmentWithTitle(self.myModel.questionToDisplay.choices[i], atIndex: i % 3, animated: false)
            }
        }
        if(settings.num_possibilities >= 9){
            for i in 6...8{
                bottomBar.insertSegmentWithTitle(self.myModel.questionToDisplay.choices[i], atIndex: i % 3, animated: false)
            }
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
            self.settings = sourceViewController.settings
            self.myModel.updateAnswerPool(self.settings) //we will only update the answer pool if any of the settings changed
            self.updateChoiceBars()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.myModel.oldSettings = settings //as soon as we start the app, save the old setting so we know if we change anything
        self.getNewQuestion() //start a game to get going
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}