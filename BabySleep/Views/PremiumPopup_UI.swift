//
//  PremiumPopupViewController.swift
//  Tinnitus
//
//  Created by Marcus Thuvesen on 2019-08-21.
//  Copyright © 2019 Marcus Thuvesen. All rights reserved.
//

import UIKit

class PremiumPopup_UI: UIViewController, UIPageViewControllerDelegate, PremiumPopupDelegate{
    
    func firstSubBtnActions() {
    }
    func secondSubBtnActions() {
    }
    func thirdSubBtnActions() {
    }
    
    
 
    @IBOutlet weak var backgroundPopupImage: UIImageView!
    @IBOutlet weak var premiumContainerView: UIView!
    
    @IBOutlet weak var secondSubBtnOutlet: UIButton!
   
    
    @IBOutlet weak var popupCollectionView: UICollectionView!
    @IBOutlet weak var popupCVPageController: UIPageControl!
    
    let premiumPopupPresenter = PremiumPopupPresenter()
    
    lazy var popupCollectionView_UI: PopupCollectionView_UI = {
        let popupCollectionView_UI = PopupCollectionView_UI(popupCVPageController : popupCVPageController, popupCollectionView : popupCollectionView)
        
        return popupCollectionView_UI
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        setupPremiumPopupUI()
    }
    
    func setupDelegates(){
        popupCollectionView.dataSource = self.popupCollectionView_UI
        popupCollectionView.delegate = self.popupCollectionView_UI
        premiumPopupPresenter.setViewDelegate(premiumPopupDelegate: self)
    }
    
    func setupPremiumPopupUI(){
        //premiumContainerView.premiumPopupContainerUI()
      //backgroundPopupImage.addBlurEffect()
        
       // firstSubBtnOutlet.normalButtonUI()
        secondSubBtnOutlet.premiumPopupContinueUI()
    }
    
    @IBAction func dismissPopupBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
 
    @IBAction func secondSubBtnClicked(_ sender: UIButton) {
        premiumPopupPresenter.whatButtonClicked(buttonName: "second")
    }
    
    @IBAction func termsOfUseBtn(_ sender: UIButton) {
       openUrl(urlStr: "https://baby-sleep-0.flycricket.io/terms.html") 
    }
    
    
    @IBAction func privacyPolicyBtn(_ sender: UIButton) {
        openUrl(urlStr: "https://baby-sleep-0.flycricket.io/privacy.html")
    }
    
    func openUrl(urlStr: String!) {
        if let url = URL(string:urlStr), !url.absoluteString.isEmpty {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    func changePremiumTintColors(firstLabel : UILabel, secondLabel : UILabel, thirdLabel : UILabel, isClicked : Bool){
        var newTintColor : UIColor
        newTintColor = isClicked == true ? UIView.CustomColors.gold : .black
        firstLabel.tintColor = newTintColor
        secondLabel.tintColor = newTintColor
        thirdLabel.tintColor = newTintColor
    }
}
