//
//  SettingsViewController.swift
//  tip_calculator
//
//  Created by Maha Govindarajan on 1/10/16.
//  Copyright © 2016 Maha Govindarajan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var colorThemeSwitch: UISwitch!
    @IBOutlet weak var colorThemeLabel: UILabel!
    @IBOutlet weak var tipPercentSegmentedControl: UISegmentedControl!
    @IBOutlet var suggestedTipSwitch: UISwitch!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    override func viewDidLoad() {
        super.viewDidLoad()
        colorThemeSwitch.on = defaults.boolForKey("colorTheme")
        suggestedTipSwitch.on = defaults.boolForKey("showSuggestedTip")
    }
    
    override func viewWillAppear(animated: Bool) {
        tipPercentSegmentedControl.selectedSegmentIndex = defaults.integerForKey("defaultTip")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onSwitchValueToggled(sender: AnyObject) {
        defaults.setBool(colorThemeSwitch.on, forKey:"colorTheme")
    }
    
    @IBAction func onSuggestedTipToggled(sender: AnyObject) {
         defaults.setBool(suggestedTipSwitch.on, forKey:"showSuggestedTip")
    }
    @IBAction func onTipValueChanged(sender: AnyObject) {
        defaults.setInteger(tipPercentSegmentedControl.selectedSegmentIndex, forKey:"defaultTip")
    }
}
