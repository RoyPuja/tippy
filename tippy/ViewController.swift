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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var tipControl: UISegmentedControl!
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)    }

    @IBAction func calculateTip(_ sender: Any) {
        
        let tipPercentages=[0.18,0.2,0.25]
    
        let bill=Double(billField.text!) ?? 0
        let tip=bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total=bill+tip
        tipLabel.text=String.init(format: "%.2f", tip)
        totalLabel.text=String.init(format: "%.2f", total)
    }
}

