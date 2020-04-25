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
    func firstSubBtnActions()
    func secondSubBtnActions()
    func thirdSubBtnActions()
}

class PremiumPopupPresenter{
    
    weak private var premiumPopupDelegate : PremiumPopupDelegate?
    
    func setViewDelegate(premiumPopupDelegate : PremiumPopupDelegate){
        self.premiumPopupDelegate = premiumPopupDelegate
    }
    
    func whatButtonClicked(){
        self.premiumPopupDelegate?.secondSubBtnActions()
    }
    
    func sendToSelectedSubscription(){
        IAPService.shared.purchase(product: .twelveMonthSubscription)
    }
}

