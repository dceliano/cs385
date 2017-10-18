//
//  ViewController.swift
//  Lab14_Gestures_Solution
//
//  Created by Troy Weingart on 9/20/16.
//  Copyright © 2016 Troy Weingart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var detectionLabel: UILabel!
    @IBOutlet weak var falconView: UIImageView!

    @IBAction func tapDetected(sender: UITapGestureRecognizer) {
        detectionLabel.text = "You just tapped."
    }
    
    @IBAction func pinchDetected(sender: UIPinchGestureRecognizer) {
        falconView.transform = CGAffineTransformMakeScale(sender.scale, sender.scale)
        detectionLabel.text = "You just pinched."
    }
    
    @IBAction func rotationDetected(sender: UIRotationGestureRecognizer) {
        detectionLabel.text = "You just rotated."
    }
    @IBAction func swipeUpDetected(sender: UISwipeGestureRecognizer) {
        detectionLabel.text = "You just swiped up."
    }
    @IBAction func swipeRightDetected(sender: UISwipeGestureRecognizer) {
        detectionLabel.text = "You just swiped right."
    }
    @IBAction func panDetected(sender: UIPanGestureRecognizer) {
        detectionLabel.text = "You just panned."
    }
    @IBAction func longPressDetected(sender: UILongPressGestureRecognizer) {
        detectionLabel.text = "You just pressed long."
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

