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
    @IBOutlet weak var firstSubBtnOutlet: UIButton!
    @IBOutlet weak var secondSubBtnOutlet: UIButton!
    @IBOutlet weak var premiumAvatarImage: UIImageView!
    @IBOutlet weak var mostValueView: UIView!
    
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
        premiumContainerView.premiumPopupContainerUI()
      //backgroundPopupImage.addBlurEffect()
        premiumAvatarImage.goldBackground()
       // firstSubBtnOutlet.normalButtonUI()
        secondSubBtnOutlet.normalButtonUI()
    }
    
    @IBAction func dismissPopupBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
 
    @IBAction func secondSubBtnClicked(_ sender: UIButton) {
        premiumPopupPresenter.whatButtonClicked(buttonName: "second")
    }

    func changePremiumTintColors(firstLabel : UILabel, secondLabel : UILabel, thirdLabel : UILabel, isClicked : Bool){
        var newTintColor : UIColor
        newTintColor = isClicked == true ? UIView.CustomColors.gold : .black
        firstLabel.tintColor = newTintColor
        secondLabel.tintColor = newTintColor
        thirdLabel.tintColor = newTintColor
    }
}
