//
//  AppStoreReviewManager.swift
//  Tinnitus
//
//  Created by Marcus Thuvesen on 2019-08-31.
//  Copyright © 2019 Marcus Thuvesen. All rights reserved.
//

import StoreKit

enum AppStoreReviewManager {
    static func requestReviewIfAppropriate() {
        SKStoreReviewController.requestReview()
    }
}
