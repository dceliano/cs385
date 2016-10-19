//
//  ViewController.swift
//  DataPersis
//
//  Created by Troy Weingart on 10/17/16.
//  Copyright © 2016 Troy Weingart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myPeople = People()
    
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var lastTextField: UITextField!
    
    @IBAction func addPerson(sender: AnyObject) {
        myPeople.persons.append(People.Person(first: firstTextField.text!, last: lastTextField.text!))
        myPeople.saveData()
        outputLabel.text = myPeople.description
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        outputLabel.text = myPeople.description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

