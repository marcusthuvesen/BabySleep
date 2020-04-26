//
//  CheckSubscription.swift
//  Tinnitus
//
//  Created by Marcus Thuvesen on 2019-10-24.
//  Copyright © 2019 Marcus Thuvesen. All rights reserved.
//

import Foundation
import TPInAppReceipt

class CheckSubscription{
    static let shared = CheckSubscription()
    func checkUserSubscription() -> Bool{
        var hasSubscription = false
        do {
            let receipt = try InAppReceipt.localReceipt()
            
            
            let purchase = receipt.activeAutoRenewableSubscriptionPurchases(ofProductIdentifier: "12MonthSubscription", forDate: Date())
        
            print("tone active 1month subs: \(purchase)")
            
            if purchase != nil{
                hasSubscription = true
                print("Has subscription")
            }
            
        } catch {
            print(error)
            if error != nil{
                print("no subscription")
            }
            hasSubscription = false
        }
        return hasSubscription
    }
    
}
