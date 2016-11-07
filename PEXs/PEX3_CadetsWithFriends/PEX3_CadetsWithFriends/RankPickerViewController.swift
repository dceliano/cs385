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
    let firstieRanks = ["C/Wing CC", "C/Wing VC", "C/Col", "C/Sq CC", "C/Lt Col", "C/Maj", "C/Flt CC", "C/Capt", "C/1st Lt", "C/ 2d Lt", "Unranked"] //rank 0 is highest, up to 10
    let twoDigRanks = ["C/CMSgt", "C/Group Supt", "C/Squad Supt", "C/SMSgt", "C/First Sgt", "C/MSgt", "C/TSgt", "Unranked"] //up to 7
    let threeDigRanks = ["C/SSgt", "Unranked"] //up to 1
    let fourDigRanks = ["C/Amn"] //only 1 rank
    var pickerDataSource = [["1","2","3","4"],["temp"]]
    
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
        if component == 0{ //we changed the class year
            if row == 0 {
                self.pickerDataSource[1] = firstieRanks
            }
            else if row == 1{
                self.pickerDataSource[1] = twoDigRanks
            }
            else if row == 2{
                self.pickerDataSource[1] = threeDigRanks
            }
            else if row == 3{
                self.pickerDataSource[1] = fourDigRanks
            }
        }
        pickerView.delegate = self
        pickerView.dataSource = self //reload the picker
        let rank_row = pickerView.selectedRowInComponent(1)
        (navigationController as! NewFriendNavigationController).rankData = pickerDataSource[1][rank_row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.pickerDataSource[1] = firstieRanks
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
