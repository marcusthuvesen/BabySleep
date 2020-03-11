//
//  AskForFeedbackUI.swift
//  Tinnitus
//
//  Created by Marcus Thuvesen on 2019-09-26.
//  Copyright © 2019 Marcus Thuvesen. All rights reserved.
//

import UIKit

class AskForFeedbackUI: UIViewController, AskForFeedbackDelegate{
    
    @IBOutlet weak var leaveFeedbackOutlet: UIButton!
    @IBOutlet weak var sendToRateOutlet: UIButton!
    @IBOutlet weak var askForFeedbackContainer: UIView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var feedbackTitle: UILabel!
    @IBOutlet weak var feedbackTextView: UITextView!
    @IBOutlet weak var feedbackTextViewHeight: NSLayoutConstraint!
    @IBOutlet weak var askForFeedbackContainerHeight: NSLayoutConstraint!
    @IBOutlet weak var hiddenFeedbackOutlet: UIButton!
    
    let askForFeedbackPresenter = AskForFeedbackPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAskForFeedbackUI()
        hideKeyboardWhenTappedAround()
        setupAskForFeedbackDelegates()
    }
    
    func setupAskForFeedbackUI(){
        hiddenFeedbackOutlet.premiumPopupContinueUI()
        leaveFeedbackOutlet.premiumPopupContinueUI()
        sendToRateOutlet.premiumPopupContinueUI()
        askForFeedbackContainer.normalButtonUI()
        avatarImage.goldBackground()
        feedbackTextView.normalButtonUI()
    }
    
    func setupAskForFeedbackDelegates(){
        askForFeedbackPresenter.setFeedbackViewDelegate(askForFeedbackDelegate: self)
    }
    
    @IBAction func dismissPopupBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func sendToRateBtn(_ sender: Any) {
        AppStoreReviewManager.requestReviewIfAppropriate()
    }
    @IBAction func leaveFeedbackBtn(_ sender: Any) {
        feedbackTitle.text = "We love feedback!"
        askForFeedbackContainerHeight.constant = CGFloat(420)
        hiddenFeedbackOutlet.isHidden = false
        leaveFeedbackOutlet.isHidden = true
        sendToRateOutlet.isHidden = true
        feedbackTextViewHeight.constant = CGFloat(200)
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
    @IBAction func hiddenFeedbackBtn(_ sender: Any) {
        let feedbackText = feedbackTextView.text ?? ""
        askForFeedbackPresenter.sendFeedbackToFirebase(feedbackText: feedbackText)
        dismiss(animated: true, completion: nil)
    }
    
}
