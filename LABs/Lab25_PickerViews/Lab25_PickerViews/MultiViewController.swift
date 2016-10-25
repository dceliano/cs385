//
//  ViewController.swift
//  Lab25_Pickers
//
//  Created by Troy Weingart on 10/22/16.
//  Copyright © 2016 madapps. All rights reserved.
//

import UIKit

class MultiViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    var pickerDataSource = [["1","2"],["A","B","C"],["a","b","c","d"]]
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return pickerDataSource.count
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerDataSource[component].count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[component][row]
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
        (parentViewController as! MyTabBarController).mData = "mPicker = comp: \(component) row: \(row)"
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


