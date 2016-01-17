//
//  CustomTipViewController.swift
//  tip_calculator
//
//  Created by Maha Govindarajan on 1/10/16.
//  Copyright © 2016 Maha Govindarajan. All rights reserved.
//

import UIKit

class CustomTipViewController: UIViewController {

    @IBOutlet weak var customTipPicker: UIPickerView!
    var selectedTip :Int = 0
    let tipPercentages: [Int] = Array(1...100)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Custom Tip Percent"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tipPercentages.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        selectedTip = row+1
        return String(selectedTip)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "segueDone") {
            let viewController = segue.destinationViewController as! ViewController;
            if (selectedTip == 1) {
            viewController.customTip = Double(selectedTip);
            }
            else {
            viewController.customTip = Double(selectedTip - 4);
            }            
        }
    }
}
