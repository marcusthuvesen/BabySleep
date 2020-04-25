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
        let url = [URL(string: "https://apps.apple.com/se/app/baby-sleep-calming-sounds/id1444518758?l=sv&ls=1")!]
        let ac = UIActivityViewController(activityItems: url, applicationActivities: nil)
        vc.present(ac, animated: true)
    }
}

