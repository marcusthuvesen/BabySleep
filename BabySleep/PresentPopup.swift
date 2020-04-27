//
//  PresentPopup.swift
//  Tinnitus
//
//  Created by Marcus Thuvesen on 2019-09-30.
//  Copyright © 2019 Marcus Thuvesen. All rights reserved.
//

import Foundation
import UIKit

func presentPopup(UIStoryboardName : String, WithIdentifier : String, tabBarVC: UIViewController?){
    if tabBarVC != nil{
       if UIStoryboardName == "AskForFeedbackPopup"{
            let popOverVC = UIStoryboard(name: UIStoryboardName, bundle: nil).instantiateViewController(withIdentifier: WithIdentifier) as! AskForFeedbackUI
            popOverVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            tabBarVC!.present(popOverVC, animated: true)
        }
    }
}

