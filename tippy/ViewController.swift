//
//  ViewController.swift
//  tippy
//
//  Created by Roy, Puja on 8/21/17.
//  Copyright © 2017 Roy, Puja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
     let currencyFormatter = NumberFormatter()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tipControl.selectedSegmentIndex = SettingsUtil.getDefaultTipIndex()
        onEditingChanged(sender: tipControl)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        
        currencyFormatter.locale = NSLocale.current
        currencyFormatter.numberStyle = .currency
        
        tipLabel.text = currencyFormatter.string(from: 0)
        totalLabel.text = currencyFormatter.string(from: 0)
        
        if let lastBillAmount = SettingsUtil.getLastBillAmount() {
            billField.text = lastBillAmount
        }
        
        // Makes it more obvious want the focus is on startup
        billField.becomeFirstResponder()
    }
    
   
   
    @IBAction func onEditingChanged(_ sender: Any) {
        let billAmountString = billField.text! as NSString
        SettingsUtil.setLastBillAmount(billAmount: billAmountString as String)
        
        let tipPercentages = [0.18, 0.20, 0.25]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = billAmountString.doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
       tipLabel.text = currencyFormatter.string(from: NSNumber(value: tip))
       totalLabel.text = currencyFormatter.string(from: NSNumber(value: total))
        
       //tipLabel.text=String.init(format: "%.2f", tip)
       //totalLabel.text=String.init(format: "%.2f", total)
        
        fadeInTotal()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: Any) {
        
        let tipPercentages=[0.18,0.2,0.25]
    
        let bill=Double(billField.text!) ?? 0
        let tip=bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total=bill+tip
        tipLabel.text=String.init(format: "%.2f", tip)
        totalLabel.text=String.init(format: "%.2f", total)
    }
    
    func fadeInTotal() {
        self.totalLabel.alpha = 0
        UIView.animate(withDuration: 0.4, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn,
                                   animations: {
                                    self.totalLabel.alpha = 1
        }, completion: nil )
    }
}

