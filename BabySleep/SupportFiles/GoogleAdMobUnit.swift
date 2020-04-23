//
//  GoogleAdMobUnit.swift
//  BabySleep
//
//  Created by Marcus Thuvesen on 2020-04-23.
//  Copyright © 2020 Marcus Thuvesen. All rights reserved.
//

import GoogleMobileAds
import Foundation

class GoogleAdMobUnit: NSObject, GADInterstitialDelegate{
    //INTERSTITIAL ADUNIT ID: Interstitial Baby Sleepca-app-pub-3370855627777048/8701731614
    //BANNER ADUNIT ID: ca-app-pub-3370855627777048/5653784491
    var interstitial : GADInterstitial!
    
    override init() {
        super.init()
        interstitial = createAndLoadInterstitial()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showInterstitialAd(VC : UIViewController){
        if interstitial.isReady {
            interstitial.present(fromRootViewController: VC)
        }
    }
    
    func createAndLoadInterstitial() -> GADInterstitial {
        let interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        interstitial.delegate = self
        interstitial.load(GADRequest())
        return interstitial
    }
    
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        interstitial = createAndLoadInterstitial()
    }
}

