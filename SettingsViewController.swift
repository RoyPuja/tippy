//
//  SettingsViewController.swift
//  tippy
//
//  Created by Roy, Puja on 8/22/17.
//  Copyright © 2017 Roy, Puja. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultTipControl.selectedSegmentIndex=SettingsUtil.getDefaultTipIndex()
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func onValueChange(_ sender: Any) {
        SettingsUtil.setDefaultTipIndex(tipIndex: defaultTipControl.selectedSegmentIndex)
    }

    

}
