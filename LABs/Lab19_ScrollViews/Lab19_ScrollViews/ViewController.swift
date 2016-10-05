//
//  ViewController.swift
//  Lab19_ScrollViews
//
//  Created by Troy Weingart on 10/5/16.
//  Copyright © 2016 Troy Weingart. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate { // UNCOMMENT #1
//class ViewController: UIViewController {  // COMMENT OUT AFTER UNCOMMENT LINE ABOVE FOR TASK #1
    
    var scrollView: UIScrollView!
    var imageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // instantiate an image view and scroll view 
        // view is a property of the viewcontroller that
        // is a reference to the view it contains
        imageView = UIImageView(image: UIImage(named: "image.png"))
        scrollView = UIScrollView(frame: view.bounds)
        
        // configure the scroll view
        scrollView.backgroundColor = UIColor.blackColor()
        scrollView.contentSize = imageView.bounds.size  // this sets the size of the area managed by the scroll view
                                                        // if its smaller than the scroll view you don't scroll...
        scrollView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]  // scrolling in width & height
        scrollView.contentOffset = CGPoint(x: 1000, y: 450)  // where to start in the scroll view
        
        // add imageView and scrollView their parents
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
        
        // TASK #1 - To get added functionality you must have the
        // ViewController adopt the UIScrollViewDelegate
        // and set the scrollView's delegate property to the
        // viewcontroller.  This functionality is added by
        // uncommenting code tagged UNCOMMENT #1
        
         scrollView.delegate = self // UNCOMMENT #1
         setZoomScale()             // UNCOMMENT #1
        
        
        // setupGestureRecognizer() // UNCOMMENT #2

    }
    
  //UNCOMMENT #1
    // this is required zooming
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    
    // This function centers the image in the scroll view at the current
    // zoom
    //UNCOMMENT #1 (BLOCK)
    func setZoomScale() {
        let imageViewSize = imageView.bounds.size
        let scrollViewSize = scrollView.bounds.size
        let widthScale = scrollViewSize.width / imageViewSize.width
        let heightScale = scrollViewSize.height / imageViewSize.height
        
        scrollView.minimumZoomScale = min(widthScale, heightScale)
        scrollView.zoomScale = 1.0
    }
    
    // UNCOMMENT #2 - TAP TO ZOOM ENABLED
//    func setupGestureRecognizer() {
//        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleDoubleTap(_:)))
//        doubleTap.numberOfTapsRequired = 2
//        scrollView.addGestureRecognizer(doubleTap)
//    }
//    
//    func handleDoubleTap(recognizer: UITapGestureRecognizer) {
//        
//        if (scrollView.zoomScale > scrollView.minimumZoomScale) {
//            scrollView.setZoomScale(scrollView.minimumZoomScale, animated: true)
//        } else {
//            scrollView.setZoomScale(scrollView.maximumZoomScale, animated: true)
//        }
//    }
}

