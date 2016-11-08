//
//  SquadronPickerButton.swift
//  PEX3_CadetsWithFriends
//
//  Created by Dom Celiano on 11/7/16.
//  Copyright © 2016 Troy Weingart. All rights reserved.
//

import UIKit

class SquadronPickerButton: UIButton {
    var squadron: Int //this is sent to the squadron details view controller
    required init?(coder aDecoder: NSCoder) {
        // set myValue before super.init is called
        self.squadron = 1
        super.init(coder: aDecoder)
    }

}
