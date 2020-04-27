//
//  SpecificFact_UI.swift
//  Tinnitus
//
//  Created by Marcus Thuvesen on 2019-08-30.
//  Copyright © 2019 Marcus Thuvesen. All rights reserved.
//

import UIKit
import GoogleMobileAds

class SpecificFact_UI: UIViewController, GADBannerViewDelegate {

    @IBOutlet weak var specificFactTitleLabel: UILabel!
    @IBOutlet weak var specificFactTextView: UITextView!
    @IBOutlet weak var bgGradientSpecificFactView: UIView!
    @IBOutlet weak var specificFactViewHeight: NSLayoutConstraint!
    @IBOutlet weak var bannerView: GADBannerView!
    
    
    var factTitleText = ""
    var factTextViewText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSpecificFactUI()
        setupAds()
    }
    
    func setupSpecificFactUI() {
        specificFactTitleLabel.text = factTitleText
        specificFactTextView.text = factTextViewText
        setSpecificHeightUI()
        gradientBackground()
    }
    
    func setupAds(){
        if !CheckSubscription.shared.checkUserSubscription() {
            print("nop subs")
            bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
            bannerView.rootViewController = self
            bannerView.load(GADRequest())
            bannerView.delegate = self
        }
    }
    
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        bannerView.alpha = 0
        UIView.animate(withDuration: 1, animations: {
            bannerView.alpha = 1
        })
    }
    
    func setSpecificHeightUI() {
        switch factTitleText {
        case "Make your baby tired":
            specificFactViewHeight.constant = CGFloat(1100)
        case "Putting baby to bed":
            specificFactViewHeight.constant = CGFloat(1100)
        case "Make baby sleep longer":
            specificFactViewHeight.constant = CGFloat(1550)
        default:
            specificFactViewHeight.constant = CGFloat(1500)
        }
    }

    func gradientBackground(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [#colorLiteral(red: 0.6274509804, green: 0.3647058824, blue: 0.462745098, alpha: 1).cgColor, #colorLiteral(red: 0.2941176471, green: 0.1647058824, blue: 0.5607843137, alpha: 1).cgColor]
        gradientLayer.shouldRasterize = true
        bgGradientSpecificFactView.layer.addSublayer(gradientLayer)
    }
    
}
