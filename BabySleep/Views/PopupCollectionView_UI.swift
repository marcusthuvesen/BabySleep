//
//  PopupCollectionView_UI.swift
//  Tinnitus
//
//  Created by Marcus Thuvesen on 2019-08-24.
//  Copyright © 2019 Marcus Thuvesen. All rights reserved.
//

import UIKit

class PopupCollectionView_UI : PremiumPopup_UI, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{

    var sliderImageArray = [UIImage(named: "stop"), UIImage(named: "ecg-lines2"), UIImage(named: "star2"), UIImage(named: "openLock2")]
    var sliderLabelArray = ["No Ads", "Unlimited Cure", "Save Favorites", "Unlock Sounds"]
    var sliderSubLabelArray = ["Remove all ads", "Use Tinnitus Matcher unlimited", "Favorite your mixed sounds for later use", "Access all sounds from the library"]
    
    var sliderTimer = Timer()
    var counter = 0
    var popupCV : UICollectionView!
    var pageController : UIPageControl!
    
    init(popupCVPageController : UIPageControl, popupCollectionView : UICollectionView){
        super.init(nibName: "PremiumPopup_UI", bundle: nil)
        self.popupCV = popupCollectionView
        self.pageController = popupCVPageController
        popupCVPageController.numberOfPages = sliderImageArray.count
        popupCVPageController.currentPage = 0
        
        sliderTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(sliderChangeImage), userInfo: nil, repeats: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        popupCV.collectionViewLayout.invalidateLayout()
    }

    @objc func sliderChangeImage(){
        if counter < sliderImageArray.count{
            scrollToCV_Image()
            counter += 1
        } else{
            counter = 0
            scrollToCV_Image()
            counter = 1
        }
    }
    
    func scrollToCV_Image(){
        let index = IndexPath.init(item: counter, section: 0)
        popupCV.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        pageController.currentPage = counter
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sliderImageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopupCV_Cell", for: indexPath) as! PopupSlider_CollectionViewCell
        if let arrayImage = sliderImageArray[indexPath.row]{
            cell.sliderCellImage.image = arrayImage
            cell.sliderCellTitleLabel.text = sliderLabelArray[indexPath.row]
            cell.sliderCellSubLabel.text = sliderSubLabelArray[indexPath.row]
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    // UICollectionViewDelegateFlowLayout -
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sectionInset = (collectionViewLayout as! UICollectionViewFlowLayout).sectionInset
        
        // Approximate height of cell
        //print(self.premiumContainerView.frame.height)
        let referenceHeight: CGFloat = collectionView.frame.height
        
        let referenceWidth = collectionView.safeAreaLayoutGuide.layoutFrame.width
            - sectionInset.left
            - sectionInset.right
            - collectionView.contentInset.left
            - collectionView.contentInset.right
        
        return CGSize(width: referenceWidth, height: referenceHeight)
    }
    
}
