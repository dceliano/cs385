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
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var topBar: UISegmentedControl!
    @IBOutlet weak var middleBar: UISegmentedControl!
    @IBOutlet weak var bottomBar: UISegmentedControl!
    @IBAction func topBarPressed(sender: AnyObject) {
        let done = barPressed(0, offset: topBar.selectedSegmentIndex)
        if(!done){ topBar.setEnabled(false, forSegmentAtIndex: topBar.selectedSegmentIndex) }
    }
    
    @IBAction func middleBarPressed(sender: AnyObject) {
        let done = barPressed(3, offset: middleBar.selectedSegmentIndex)
        if(!done){ middleBar.setEnabled(false, forSegmentAtIndex: middleBar.selectedSegmentIndex) }
    }
    @IBAction func bottomBarPressed(sender: AnyObject) {
        let done = barPressed(6, offset: bottomBar.selectedSegmentIndex)
        if(!done){ bottomBar.setEnabled(false, forSegmentAtIndex: bottomBar.selectedSegmentIndex) }
    }
    func barPressed(barStartIndex: Int, offset: Int) -> Bool{ //returns if the game is over or not
        guess_correct = self.myModel.makeGuess(barStartIndex + offset)
        if(guess_correct){
            statusLabel.text = "Correct!"
            CATransaction.flush()
            sleep(1)
            self.getNewQuestion()
            return true
        }
        else{
            statusLabel.text = "You are wrong. Try again."
            return false
        }
    }
    
    func getNewQuestion(){
        questionToDisplay = myModel.getNewQuestion(settings)
        if(questionToDisplay.game_over){
            let alertController = UIAlertController(title: "Quiz Finished", message: "You scored a \(questionToDisplay.quiz_score)%", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "New Quiz", style: UIAlertActionStyle.Default,handler: gameOverAlertHandler))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        else{
            imageView.image = UIImage(named: questionToDisplay.image_name)
            self.updateChoiceBars()
            statusLabel.text = "Please select the country where the landmark is located."
        }
    }
    
    func gameOverAlertHandler(alert: UIAlertAction!){
        myModel.resetGame()
        self.getNewQuestion()
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
            let get_new_question = self.myModel.updateAnswerPool(self.settings)
            if(get_new_question){ self.getNewQuestion() }
            self.updateChoiceBars()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.myModel.oldSettings = settings //as soon as we start the app, save the old setting so we know if we change anything
        self.myModel.loadImagesIntoArray() //read all the image names into an array
        self.getNewQuestion() //pop up a question to get going
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}