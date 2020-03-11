//
//  ShareOnSocialMedia.swift
//  Tinnitus
//
//  Created by Marcus Thuvesen on 2019-08-31.
//  Copyright © 2019 Marcus Thuvesen. All rights reserved.
//

import Foundation
import StoreKit

class ShareOnSocialMedia : UIViewController{
    func shareAppOnSocialMedia(vc : UIViewController){
        //Should be changed to Appstore link
        let url = [URL(string: "https://apps.apple.com/se/app/rumster/id1444518758")!]
        let ac = UIActivityViewController(activityItems: url, applicationActivities: nil)
        vc.present(ac, animated: true)
    }
}

