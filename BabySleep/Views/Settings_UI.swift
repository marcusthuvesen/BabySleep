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
        settingsPremiumOutlet.premiumButtonUI()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        gradientBackground()
    }
    
    func gradientBackground(){
        // Create a gradient layer.
        let gradientLayer = CAGradientLayer()
        // Set the size of the layer to be equal to size of the display.
        gradientLayer.frame = view.bounds
        // Set an array of Core Graphics colors (.cgColor) to create the gradient.
        // This example uses a Color Literal and a UIColor from RGB values.
        gradientLayer.colors = [#colorLiteral(red: 0.6274509804, green: 0.3647058824, blue: 0.462745098, alpha: 1).cgColor, #colorLiteral(red: 0.2941176471, green: 0.1647058824, blue: 0.5607843137, alpha: 1).cgColor]
        // Rasterize this static layer to improve app performance.
        gradientLayer.shouldRasterize = true
        // Apply the gradient to the backgroundGradientView.
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

    @IBAction func aboutBtn(_ sender: UIButton) {
     //   let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "About_UI") as! About_UI
    //    tabBarController?.present(popOverVC, animated: true)
    }
    @IBAction func sendFeedbackBtn(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "AskForFeedbackPopup", bundle: nil).instantiateViewController(withIdentifier: "AskForFeedbackUI") as! AskForFeedbackUI
        popOverVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        tabBarController?.present(popOverVC, animated: true)
    }
    
    @IBAction func settingsPremiumBtn(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "PremiumPopup", bundle: nil).instantiateViewController(withIdentifier: "PremiumPopup_UI") as! PremiumPopup_UI
        popOverVC.modalPresentationStyle = .overCurrentContext
        tabBarController?.present(popOverVC, animated: true)
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
