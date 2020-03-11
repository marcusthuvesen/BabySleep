//
//  PresentPopup.swift
//  Tinnitus
//
//  Created by Marcus Thuvesen on 2019-09-30.
//  Copyright © 2019 Marcus Thuvesen. All rights reserved.
//

import Foundation
import UIKit

func presentPopup(UIStoryboardName : String, WithIdentifier : String, tabBarController : UITabBarController?){
    if tabBarController != nil{
        let popOverVC = UIStoryboard(name: "AskForFeedbackPopup", bundle: nil).instantiateViewController(withIdentifier: "AskForFeedbackUI") as! AskForFeedbackUI
        popOverVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        tabBarController!.present(popOverVC, animated: true)
    }
}
