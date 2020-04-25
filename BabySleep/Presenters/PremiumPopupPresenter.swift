//
//  PremiumPopupVC.swift
//  Tinnitus
//
//  Created by Marcus Thuvesen on 2019-08-28.
//  Copyright © 2019 Marcus Thuvesen. All rights reserved.
//

import Foundation
import UIKit

protocol PremiumPopupDelegate: NSObjectProtocol {
   
}

class PremiumPopupPresenter{
    
    weak private var premiumPopupDelegate : PremiumPopupDelegate?
    
    
    func setViewDelegate(premiumPopupDelegate : PremiumPopupDelegate){
        self.premiumPopupDelegate = premiumPopupDelegate
    }
    
    
    func sendToSelectedSubscription(){
        print("send to selected subs")
        IAPService.shared.purchase(product: .twelveMonthSubscription)
    }
}

