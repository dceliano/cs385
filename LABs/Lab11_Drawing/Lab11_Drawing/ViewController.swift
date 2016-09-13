//
//  ViewController.swift
//  Lab11_Drawing
//
//  Created by Troy Weingart on 9/12/16.
//  Copyright © 2016 Troy Weingart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myImage: UIImageView!
    
    @IBAction func clearCanvas(sender: AnyObject) {
        myImage.image = nil
    }
    
    @IBAction func createCircle(sender: AnyObject) {
        // Create a bitmap based graphics context of size (300,300)
        // it is not opaque and has a scaling factor of 0 (no scaling)
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(300,300), false, 0)
        // The previous call doesn't return a reference to the newly created 
        // graphics context so grab a reference to it with the call below
        let con = UIGraphicsGetCurrentContext()!
        // Draw an elipse using a Core Image call
        CGContextAddEllipseInRect(con, CGRectMake(25,25,250,250))
        // Set the fill color
        CGContextSetFillColorWithColor(con, UIColor.blueColor().CGColor)
        // Fill the elipse
        CGContextFillPath(con)
        // create an image from the current context
        let im = UIGraphicsGetImageFromCurrentImageContext()
        // remove the graphics context from the top of the context stack (end it)
        UIGraphicsEndImageContext()
        // update the UIImageView with the newly created image
        myImage.image = im
    }
    
    @IBAction func createElipse(sender: AnyObject) {
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(300,300), false, 0)
        let context = UIGraphicsGetCurrentContext()!
        CGContextAddEllipseInRect(context, CGRectMake(50,25,200,250))
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        CGContextFillPath(context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        myImage.image = image
        UIGraphicsEndImageContext()
    }
    
    @IBAction func createRectangle(sender: AnyObject) {
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(300,300), false, 0)
        let context = UIGraphicsGetCurrentContext()!
        CGContextAddRect(context, CGRectMake(100, 25, 100, 250))
        CGContextSetFillColorWithColor(context, UIColor.greenColor().CGColor)
        CGContextFillPath(context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        myImage.image = image
        UIGraphicsEndImageContext()
    }
    
    @IBAction func createLines(sender: AnyObject) {
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(300,300), false, 0)
        let context = UIGraphicsGetCurrentContext()!
        CGContextMoveToPoint(context, 25, 25)
        CGContextAddLineToPoint(context, 275, 275)
        CGContextMoveToPoint(context, 275, 25)
        CGContextAddLineToPoint(context, 25, 275)
        CGContextStrokePath(context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        myImage.image = image
        UIGraphicsEndImageContext()
    }
    
    @IBAction func createTriangle(sender: AnyObject) {
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(300,300), false, 0)
        let context = UIGraphicsGetCurrentContext()!
        CGContextMoveToPoint(context, 150, 25)
        CGContextAddLineToPoint(context, 275, 275)
        CGContextAddLineToPoint(context, 25, 275)
        CGContextAddLineToPoint(context, 150, 25)
        CGContextStrokePath(context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        myImage.image = image
        UIGraphicsEndImageContext()
    }
    
    @IBAction func createFun(sender: AnyObject) {
        
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

