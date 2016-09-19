//
//  ViewController.swift
//  Lab12_Image_Animation
//
//  Created by Troy Weingart on 9/14/16.
//  Copyright © 2016 Troy Weingart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var falconImageList: [UIImage] = []
    let imageLayer = CALayer()
    var oldTrans: CATransform3D = CATransform3DIdentity
    
    
    @IBOutlet weak var backGround: UIImageView!
    @IBOutlet weak var falcon1: UIImageView!
    @IBOutlet weak var falcon2: UIImageView!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var flyButton: UIButton!
    @IBOutlet weak var speedStepper: UIStepper!
    @IBOutlet weak var speedSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for i in 1...21{
            falconImageList += [UIImage(named:"falcon-\(i).png")!]
        }
        falcon1.animationImages = falconImageList
        falcon1.animationDuration = Double(2.0 - speedSlider.value)
        
        let image = UIImage(named: "falcon-1.png")!
        imageLayer.contents = image.CGImage
        imageLayer.frame = CGRect(x: 132, y: 100, width: 150, height: 150)
        backGround.layer.addSublayer(imageLayer)
        oldTrans = imageLayer.transform //save the transform so we can restore its original state
    }
    @IBAction func flyLand(sender: UIButton) {
        if(!falcon1.isAnimating()){
            falcon1.startAnimating()
            falcon2.image = UIImage.animatedImageWithImages(falconImageList, duration: Double(2.0-speedSlider.value))
            speedLabel.text = "Speed of an unlaiden Falcon: \(1.0/(1.01-speedSlider.value))"
            flyButton.setTitle("Land", forState: .Normal)
        }
        else{
            falcon1.stopAnimating()
            falcon2.image = UIImage(named:"falcon-1.png")
            speedLabel.text = "Speed of an unlaiden Falcon: 0.00"
            flyButton.setTitle("Fly Away", forState: .Normal)
        }
    }
    @IBAction func sliderChange(sender: AnyObject) {
        speedStepper.value = Double(speedSlider.value)
        changeDuration()
        speedLabel.text = "Speed of an unlaiden Falcon: \(1.0/(1.01-speedSlider.value))"
    }
    @IBAction func stepperChange(sender: AnyObject) {
        speedSlider.value = Float(speedStepper.value)
        changeDuration()
        speedLabel.text = "Speed of an unlaiden Falcon: \(1.0/(1.01-speedSlider.value))"
    }
    
    func changeDuration(){
        falcon1.animationDuration = Double(2.0 - speedSlider.value)
        falcon1.startAnimating()
        falcon2.image = UIImage.animatedImageWithImages(falconImageList, duration: Double(2.0-speedSlider.value))
    }
    
    @IBAction func spinBird(sender:AnyObject){
        var t: CATransform3D = CATransform3DIdentity
        
        t = CATransform3DRotate(t, 1.5*CGFloat(M_PI), 0, 0, 1)
        imageLayer.transform = t
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

