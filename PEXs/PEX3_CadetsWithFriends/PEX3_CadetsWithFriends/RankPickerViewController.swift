//
//  RankPickerViewController.swift
//  PEX3_CadetsWithFriends
//
//  Created by Dom Celiano on 11/6/16.
//  Copyright © 2016 Troy Weingart. All rights reserved.
//

import UIKit

class RankPickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var pickerView: UIPickerView!
    var firstieRanks = ["Cadet Wing Commander", "Cadet Vice Wing Commander", "Cadet Colonel", "Cadet Squadron Commander", "Cadet Lieutenant Colonel", "Cadet Major", "Cadet Flight Commander", "Cadet Captain", "Cadet 1st Lieutenant", "Cadet 2d Lieutenant", "Unranked Firstie"] //rank 0 is highest, up to 10
    var twoDigRanks = ["Cadet Command Chief", "Cadet Group Superintendent", "Cadet Squadron Superintendent", "Cadet Senior Master Sergeant", "Cadet First Shirt", "Cadet Master Sergeant", "Cadet Technical Sergeant", "Unranked Two-Dig"] //up to 7
    var threeDigRanks = ["Cadet Staff Sergeant", "Unranked Three-Dig"] //up to 1
    var fourDigRanks = ["Cadet Airman"] //only 1 rank
    
    var pickerDataSource = ["temp"]
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerDataSource.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //pickerView.delegate = self
        //pickerView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
