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
            let purchase2 = receipt.activeAutoRenewableSubscriptionPurchases(ofProductIdentifier: "se.marcusthuvesen.Tinnitus.6MonthSub", forDate: Date())
            let purchase3 = receipt.activeAutoRenewableSubscriptionPurchases(ofProductIdentifier: "se.marcusthuvesen.Tinnitus.12MonthSub", forDate: Date())
            print("tone active 1month subs: \(purchase)")
            print("tone active 6month subs: \(purchase2)")
            print("tone active 12month subs: \(purchase3)")
            //retrive all auto renewable subscription purchases for a specific product
            //            let allAutoRenewableSubscriptionPurchases = receipt.purchases(ofProductIdentifier: "se.marcusthuvesen.Tinnitus.1MonthSub").filter({ return $0.isRenewableSubscription })
            //print("tone \(allAutoRenewableSubscriptionPurchases)")
            if purchase != nil || purchase2 != nil || purchase3 != nil {
                hasSubscription = true
                print("tone: Has subscription")
            }
            
        } catch {
            print(error)
            if error != nil{
                print("tone: no subscription")
            }
            hasSubscription = false
        }
        return hasSubscription
    }
    
}
