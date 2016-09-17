//
//  ViewController.swift
//  tipcalculator
//
//  Created by Sneha Pimpalkar on 9/11/16.
//  Copyright © 2016 Sneha Pimpalkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSelected: UISegmentedControl!
    @IBOutlet weak var savedTipLabel: UILabel!
    
    
    override func viewWillAppear(animated: Bool) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTip = defaults.doubleForKey("defaultTip")
        
        savedTipLabel.text = String(format: "%.2f%",defaultTip)
        onSavedTipBtnTap(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func dismissKeyboard(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func calculateTipFromPresets() {
        let tipPercent = [0.15, 0.20, 0.25]
        calculateTip(tipPercent[tipSelected.selectedSegmentIndex])
    }
    
    @IBAction func calculateTip(tipPercentage: Double) {
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentage
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onSavedTipBtnTap(sender: AnyObject) {
        let savedTip = Double(savedTipLabel.text!) ?? 0
        calculateTip(savedTip/100)
    }
}

