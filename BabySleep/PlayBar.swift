//
//  PlayBar.swift
//  Tinnitus
//
//  Created by Marcus Thuvesen on 2019-09-03.
//  Copyright © 2019 Marcus Thuvesen. All rights reserved.
//
import UIKit

class PlayBar: UIView {
    
    let kCONTENT_XIB_NAME = "PlayBarView"
    @IBOutlet weak var playBtnOutlet: UIButton!
    @IBOutlet weak var premiumBtnOutlet: UIButton!
    @IBOutlet weak var timerBtnOutlet: UIButton!
    @IBOutlet var playBarView: UIView!
    static var currentWindow = UIViewController()
    static var shared = PlayBar()
    static var playBtnIsSelected = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        playBtnOutlet.addTarget(self, action: #selector(self.playBtnAction(sender:)), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleSelectedNotification(notification:)), name: NSNotification.Name(rawValue: GlobalVariables.selectedNotification), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleUnSelectedNotification(notification:)), name: NSNotification.Name(rawValue: GlobalVariables.unselectedNotification), object: nil)
    }
    
    
    @objc func handleSelectedNotification(notification : Notification){
        setButtonToSelected()
    }
    
    @objc func handleUnSelectedNotification(notification : Notification){
        setButtonToUnSelected()
    }
    
    
    func commonInit() {
        Bundle.main.loadNibNamed(kCONTENT_XIB_NAME, owner: self, options: nil)
        playBarView.fixInView(self)
    }
    
    func setButtonToSelected(){
        playBtnOutlet.setImage(UIImage(named: "pause"), for: .normal)
        print("print setting image to pause")
        PlayBar.playBtnIsSelected = true
    }
    
    func setButtonToUnSelected(){
        playBtnOutlet.setImage(UIImage(named: "play"), for: .normal)
        print("print setting image to play")
        PlayBar.playBtnIsSelected = false
    }
    
    
    
    
    @objc func playBtnAction(sender: UIButton){
        PlayBar.playBtnIsSelected = !PlayBar.playBtnIsSelected
        if PlayBar.playBtnIsSelected{
            setButtonToSelected()
                DispatchQueue.global(qos: .background).async {
                    SoundVC_UI.soundsCurrentlyPlaying.playAll()
                }
        }else{
            setButtonToUnSelected()
            DispatchQueue.global(qos: .background).async {
                SoundVC_UI.soundsCurrentlyPlaying.stopAll()
            }
        }
    }
    
    @IBAction func premiumBtnAction(_ sender: Any) {
        let vc = UIStoryboard(name: "PremiumPopup", bundle: nil).instantiateViewController(withIdentifier: "PremiumPopup_UI") as! PremiumPopup_UI
        vc.modalPresentationStyle = .overCurrentContext
        let currentController = self.getCurrentViewController()
        currentController?.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func timerBtnAction(_ sender: Any) {
        let vc = UIStoryboard(name: "SleepTimerPopup", bundle: nil).instantiateViewController(withIdentifier: "SleepTimerPopup_UI") as! SleepTimerPopup_UI
        vc.modalPresentationStyle = .overCurrentContext
        let currentController = self.getCurrentViewController()
        currentController?.present(vc, animated: true, completion: nil)
        
    }
    
    func getCurrentViewController() -> UIViewController? {
        if let rootController = UIApplication.shared.keyWindow?.rootViewController {
            var currentController: UIViewController! = rootController
            while( currentController.presentedViewController != nil ) {
                currentController = currentController.presentedViewController
            }
            return currentController
        }
        return nil
    }
    
}

extension UIView
{
    func fixInView(_ container: UIView!) -> Void{
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame;
        container.addSubview(self);
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
}
