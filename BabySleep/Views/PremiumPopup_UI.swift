//
//  PremiumPopupViewController.swift
//  Tinnitus
//
//  Created by Marcus Thuvesen on 2019-08-21.
//  Copyright © 2019 Marcus Thuvesen. All rights reserved.
//

import UIKit

class PremiumPopup_UI: UIViewController, UIPageViewControllerDelegate, PremiumPopupDelegate{
    
 
    @IBOutlet weak var backgroundPopupImage: UIImageView!
    @IBOutlet weak var premiumContainerView: UIView!
    @IBOutlet weak var continueBtnOutlet: UIButton!
    @IBOutlet weak var firstSubBtnOutlet: UIButton!
    @IBOutlet weak var secondSubBtnOutlet: UIButton!
    @IBOutlet weak var thirdSubBtnOutlet: UIButton!
    @IBOutlet weak var premiumAvatarImage: UIImageView!
    
    @IBOutlet weak var mostPopularView: UIView!
    @IBOutlet weak var mostValueView: UIView!
    
    @IBOutlet weak var firstPopupBtnView: UIView!
    @IBOutlet weak var secondPopupBtnView: UIView!
    @IBOutlet weak var thirdPopupBtnView: UIView!
    
    @IBOutlet weak var firstPopupViewLabelOne: UILabel!
    @IBOutlet weak var firstPopupViewLabelTwo: UILabel!
    @IBOutlet weak var firstPopupViewLabelThree: UILabel!
    
    @IBOutlet weak var secondPopupViewLabelOne: UILabel!
    @IBOutlet weak var secondPopupViewLabelTwo: UILabel!
    @IBOutlet weak var secondPopupViewLabelThree: UILabel!
    
    @IBOutlet weak var thirdPopupViewLabelOne: UILabel!
    @IBOutlet weak var thirdPopupViewLabelTwo: UILabel!
    @IBOutlet weak var thirdPopupViewLabelThree: UILabel!
    
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
        premiumContainerView.premiumPopupContinueUI()
        continueBtnOutlet.premiumPopupContinueUI()
      //  backgroundPopupImage.addBlurEffect()
        premiumAvatarImage.goldBackground()
        mostPopularView.mostPopularButtonUI()
        
        firstSubBtnOutlet.normalButtonUI()
        secondSubBtnOutlet.normalButtonUI()
        thirdSubBtnOutlet.normalButtonUI()

        firstPopupBtnView.disselectedPopupButtonsUI()
        secondPopupBtnView.selectedPopupButtonUI()
        thirdPopupBtnView.disselectedPopupButtonsUI()
    }
    
    @IBAction func dismissPopupBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func firstSubBtnClicked(_ sender: UIButton) {
        premiumPopupPresenter.whatButtonClicked(buttonName: "first")
    }
    @IBAction func secondSubBtnClicked(_ sender: UIButton) {
        premiumPopupPresenter.whatButtonClicked(buttonName: "second")
    }
    @IBAction func thirdSubBtnClicked(_ sender: UIButton) {
        premiumPopupPresenter.whatButtonClicked(buttonName: "third")
        
    }

    func changePremiumTintColors(firstLabel : UILabel, secondLabel : UILabel, thirdLabel : UILabel, isClicked : Bool){
        var newTintColor : UIColor
        newTintColor = isClicked == true ? UIView.CustomColors.gold : .black
        firstLabel.tintColor = newTintColor
        secondLabel.tintColor = newTintColor
        thirdLabel.tintColor = newTintColor
    }
    
    func firstSubBtnActions(){
        mostPopularView.isHidden = true
        firstPopupBtnView.selectedPopupButtonUI()
        secondPopupBtnView.disselectedPopupButtonsUI()
        thirdPopupBtnView.disselectedPopupButtonsUI()
        changePremiumTintColors(firstLabel: firstPopupViewLabelOne, secondLabel: firstPopupViewLabelTwo, thirdLabel: firstPopupViewLabelThree, isClicked: true)
        changePremiumTintColors(firstLabel: secondPopupViewLabelOne, secondLabel: secondPopupViewLabelTwo, thirdLabel: secondPopupViewLabelThree, isClicked: false)
        changePremiumTintColors(firstLabel: thirdPopupViewLabelOne, secondLabel: thirdPopupViewLabelTwo, thirdLabel: thirdPopupViewLabelThree, isClicked: false)
    }
    
    func secondSubBtnActions(){
        mostPopularView.isHidden = false
        firstPopupBtnView.disselectedPopupButtonsUI()
        secondPopupBtnView.selectedPopupButtonUI()
        thirdPopupBtnView.disselectedPopupButtonsUI()
        changePremiumTintColors(firstLabel: firstPopupViewLabelOne, secondLabel: firstPopupViewLabelTwo, thirdLabel: firstPopupViewLabelThree, isClicked: false)
        changePremiumTintColors(firstLabel: secondPopupViewLabelOne, secondLabel: secondPopupViewLabelTwo, thirdLabel: secondPopupViewLabelThree, isClicked: true)
        changePremiumTintColors(firstLabel: thirdPopupViewLabelOne, secondLabel: thirdPopupViewLabelTwo, thirdLabel: thirdPopupViewLabelThree, isClicked: false)
    }
    
    func thirdSubBtnActions(){
        mostPopularView.isHidden = true
        firstPopupBtnView.disselectedPopupButtonsUI()
        secondPopupBtnView.disselectedPopupButtonsUI()
        thirdPopupBtnView.selectedPopupButtonUI()
        changePremiumTintColors(firstLabel: firstPopupViewLabelOne, secondLabel: firstPopupViewLabelTwo, thirdLabel: firstPopupViewLabelThree, isClicked: false)
        changePremiumTintColors(firstLabel: secondPopupViewLabelOne, secondLabel: secondPopupViewLabelTwo, thirdLabel: secondPopupViewLabelThree, isClicked: false)
        changePremiumTintColors(firstLabel: thirdPopupViewLabelOne, secondLabel: thirdPopupViewLabelTwo, thirdLabel: thirdPopupViewLabelThree, isClicked: true)
    }
   
    
}
