//
//  CheckSubscription.swift
//  BabySleep
//
//  Created by Marcus Thuvesen on 2020-04-23.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import Foundation
import TPInAppReceipt

class CheckSubscription{
    static let shared = CheckSubscription()
    func checkUserSubscription() -> Bool{
        var hasSubscription = false
        do {
            let receipt = try InAppReceipt.localReceipt()
            
            let purchase = receipt.activeAutoRenewableSubscriptionPurchases(ofProductIdentifier: "se.marcusthuvesen.Tinnitus.1MonthSub", forDate: Date())
            
            print("tone active 12month subs: \(purchase)")
            //retrive all auto renewable subscription purchases for a specific product
            //            let allAutoRenewableSubscriptionPurchases = receipt.purchases(ofProductIdentifier: "se.marcusthuvesen.Tinnitus.1MonthSub").filter({ return $0.isRenewableSubscription })
            //print("tone \(allAutoRenewableSubscriptionPurchases)")
            if purchase != nil {
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
