//
//  ViewController.swift
//  tip_calculator
//
//  Created by Maha Govindarajan on 1/9/16.
//  Copyright © 2016 Maha Govindarajan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    @IBOutlet weak var numberOfPeopleField: UITextField!
    @IBOutlet weak var totalText: UILabel!
    @IBOutlet weak var tipText: UILabel!
    @IBOutlet var suggestedTipImage: UIButton!
    
    @IBOutlet weak var tipLabel: UILabel!
    var customTip :Double = 0.0
    var minTip :Double = 0.0
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipLabel.text = "$0.00";
        totalLabel.text = "$0.00";
        
        self.billAmountField.becomeFirstResponder()
        self.navigationItem.title = "Tip Calculator"
        print(customTip)
        if(customTip != minTip) {
        tipControl.selectedSegmentIndex = defaults.integerForKey("defaultTip")
        }
        else {
             tipControl.selectedSegmentIndex = 3
        }
        if let date = defaults.objectForKey("lastSavedTime") as! NSDate! {
            if(NSDate().timeIntervalSinceDate(date) < 600) {
                billAmountField.text = defaults.stringForKey("billAmount")
             }
        }
        suggestedTipImage.hidden = !defaults.boolForKey("showSuggestedTip")
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.title = "Tip Calculator"
        if(customTip != 0) {
            tipLabel.text = "$0.00 ( \(customTip)% )";
            tipControl.selectedSegmentIndex = 3
        }
        else {
            tipControl.selectedSegmentIndex = defaults.integerForKey("defaultTip")
        }
        if(defaults.boolForKey("colorTheme")) {
            view.backgroundColor = UIColor.lightGrayColor()
        }
        else {
            view.backgroundColor = UIColor.whiteColor()
        }
        
        suggestedTipImage.hidden = !defaults.boolForKey("showSuggestedTip")
        computeValues()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onBillEditingChanged(sender: AnyObject) {
       computeValues()
    }

    @IBAction func onScreenTapped(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func onTipValueChanged(sender: AnyObject) {
       customTip = 0
        if(tipControl.selectedSegmentIndex == 3) {
            let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("CustomTipViewControllerID") as! CustomTipViewController
            self.navigationItem.title = "Custom Tip Percent"
            self.navigationController?.pushViewController(secondViewController, animated: true)
        }
    }
    
    @IBAction func onNumberOfPeopleChanged(sender: AnyObject) {
        computeValues()
    }
    
    func computeValues() {
        let billAmount = Double(billAmountField.text!)
        var numberOfPeople = Double(numberOfPeopleField.text!)
        var tipPercent :Double = 0.0
        var tip :Double = 0.0
        var total :Double = 0.0
        var tipPercentages = [0.18, 0.20, 0.22]
        if(numberOfPeopleField.text == "" || numberOfPeople <= 0) {
            numberOfPeople = 1
        }
        if(customTip != 0 && billAmountField.text != "" && tipControl.selectedSegmentIndex == 3) {
            tip = (billAmount! * Double(customTip/100)) / numberOfPeople!
            total = (billAmount! + tip ) / numberOfPeople!
        }
        else if(billAmountField.text != "" && tipControl.selectedSegmentIndex != 3){
            tipPercent = tipPercentages[tipControl.selectedSegmentIndex]
            tip = (billAmount! * tipPercent ) / numberOfPeople!
            total = (billAmount! + tip) / numberOfPeople!
        }
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        if(numberOfPeople > 1) {
            tipText.text = "Tip per Person"
            totalText.text = "Total per person"
        } else {
            tipText.text = "Tip"
            totalText.text = "Total"
        }
        if( customTip != 0  && tipControl.selectedSegmentIndex == 3 ) {
        tipLabel.text = String(format: "$%.2f", tip) + " ( \(customTip)% )"
        }

        defaults.setObject(billAmountField.text, forKey: "billAmount")
        defaults.setObject(NSDate(), forKey : "lastSavedTime")
    }
}

