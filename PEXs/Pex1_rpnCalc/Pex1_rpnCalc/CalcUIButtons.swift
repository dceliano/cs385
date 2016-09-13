//
//  CalcUIButtons.swift
//  Pex1_rpnCalc
//
//  Created by Dom Celiano on 9/12/16.
//  Copyright © 2016 Dom Celiano. All rights reserved.
//

import Foundation
import UIKit

class CalcNumberButton: UIButton {
    @IBInspectable var val : Int = 0
}

class CalcOpButton: UIButton{
    @IBInspectable var op : String = "+"
}