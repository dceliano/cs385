//
//  ViewController.swift
//  Lab25_Pickers
//
//  Created by Troy Weingart on 10/22/16.
//  Copyright © 2016 madapps. All rights reserved.
//

import UIKit

class SingleViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var pickerView: UIPickerView!

    var pickerDataSource = ["White", "Red", "Green", "Blue"]
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerDataSource.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 0 {self.view.backgroundColor = UIColor.whiteColor()}
        else if row == 1{
            self.view.backgroundColor = UIColor.redColor()
        }
        else if row == 2{
            self.view.backgroundColor = UIColor.greenColor()
        }
        else if row == 3{
            self.view.backgroundColor = UIColor.cyanColor()
        }
        (parentViewController as! MyTabBarController).sData = "sPicker = comp: \(component) row: \(row)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

