//
//  SettingsViewController.swift
//  tipcalculator
//
//  Created by Sneha Pimpalkar on 9/14/16.
//  Copyright © 2016 Sneha Pimpalkar. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController{


    @IBOutlet weak var defaultTipField: UITextField!

    @IBAction func saveBtn(sender: AnyObject) {
        
        let defaultTip = Double(defaultTipField .text!) ?? 0
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(defaultTip, forKey: "defaultTip")
        defaults.synchronize()
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
view.endEditing(true)
    }
}
