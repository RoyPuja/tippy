//
//  SettingsHelper.swift
//  tippy
//
//  Created by Roy, Puja on 8/22/17.
//  Copyright © 2017 Roy, Puja. All rights reserved.
//

import UIKit

class SettingsHelper {

    struct Constants {
        static let defaultTipIndexKey = "default_tip_index"
        static let lastBillAmountKey = "last_bill_amount"
        static let lastBillTimestampKey = "last_bill_timestamp"
        
        // Persist bill amount across app restarts for 10 minutes
        static let billAmountTimeToLive = TimeInterval(10 * 60)
        
        static let defaults = UserDefaults.standard
    }
    
    class func setDefaultTipIndex(tipIndex: Int) {
        Constants.defaults.set(tipIndex, forKey: Constants.defaultTipIndexKey)
        Constants.defaults.synchronize()
    }
    
    class func getDefaultTipIndex() -> Int {
        return Constants.defaults.integer(forKey: Constants.defaultTipIndexKey)
    }
    
    class func setLastBillAmount(billAmount: String) {
        Constants.defaults.set(billAmount, forKey: Constants.lastBillAmountKey)
        Constants.defaults.set(NSDate(), forKey: Constants.lastBillTimestampKey)
        
        Constants.defaults.synchronize()
    }
    
    // This optionally returns the last bill amount used in the app, as long as the value was set at most billAmountTimeToLive seconds ago
    class func getLastBillAmount() -> String? {
        let now = NSDate()
        let lastBillTimestamp = Constants.defaults.object(forKey: Constants.lastBillTimestampKey) as! NSDate?
        
        // I originally wanted to use timeIntervalSinceNow but the resulting negative interval made this expression far too unwieldy.
        // let shouldUseLastBillAmount = lastBillTimestamp != nil && lastBillTimestamp!.timeIntervalSinceNow >= -Constants.billAmountTimeToLive
        
        let isBillAmountExpired = lastBillTimestamp == nil || now.timeIntervalSince(lastBillTimestamp! as Date) > Constants.billAmountTimeToLive
        
        if isBillAmountExpired {
            return nil
        } else {
            return Constants.defaults.object(forKey: Constants.lastBillAmountKey) as! String?
        }
    }

}
