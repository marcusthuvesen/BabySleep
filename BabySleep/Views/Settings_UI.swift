//
//  SettingsViewController.swift
//  Tinnitus
//
//  Created by Marcus Thuvesen on 2019-08-19.
//  Copyright © 2019 Marcus Thuvesen. All rights reserved.
//

import UIKit
import MessageUI

class Settings_UI: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var settingsPremiumOutlet: UIButton!
    @IBOutlet weak var bgGradientSettingsView: UIView!
    let shareOnSocialMedia = ShareOnSocialMedia()
    override func viewDidLoad() {
        super.viewDidLoad()
       setupSettingsUI()
    }
    
    func setupSettingsUI(){
        settingsPremiumOutlet.premiumPopupContinueUI()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        gradientBackground()
    }
    
    func gradientBackground(){
        // Create a gradient layer.
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [#colorLiteral(red: 0.6941176471, green: 0.3843137255, blue: 0.6352941176, alpha: 1).cgColor, #colorLiteral(red: 0.2941176471, green: 0.1647058824, blue: 0.5607843137, alpha: 1).cgColor]
        gradientLayer.shouldRasterize = true
        bgGradientSettingsView.layer.addSublayer(gradientLayer)
    }
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["marcus.thuvesen@gmail.com"])
            mail.setMessageBody("<p>What can i help you with? :)</p>", isHTML: true)
            
            present(mail, animated: true)
        } else {
            print("message couldn't be sent")
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    @IBAction func settingsPremiumBtn(_ sender: Any) {
        let vc = UIStoryboard(name: "PremiumPopup", bundle: nil).instantiateViewController(withIdentifier: "PremiumPopup_UI") as! PremiumPopup_UI
        vc.modalPresentationStyle = .overCurrentContext
        let currentController = PlayBar.shared.getCurrentViewController()
        currentController?.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func supportBtn(_ sender: UIButton) {
        sendEmail()
    }
    
    @IBAction func rateUsBtn(_ sender: UIButton) {
        AppStoreReviewManager.requestReviewIfAppropriate()
    }
    
    @IBAction func shareOnSocialMediaBtn(_ sender: Any) {
        shareOnSocialMedia.shareAppOnSocialMedia(vc : self)
    }
    
}
