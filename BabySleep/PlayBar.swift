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
    @IBOutlet weak var favoriteBtnOutlet: UIButton!
    @IBOutlet weak var timerBtnOutlet: UIButton!
    @IBOutlet var playBarView: UIView!
    static var currentWindow = UIViewController()
    static var currentlyPlaying = false
    static var playBtnManuallySelected : Bool?
    static var observerAlreadySetup = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("In override init")
        
        //commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        if !PlayBar.observerAlreadySetup{
            
            print("In common init")
            setupObservers()
            PlayBar.observerAlreadySetup = true
              playBtnOutlet.addTarget(self, action: #selector(self.playBtnAction(sender:)), for: .touchUpInside)
        }
    }
    
    func setupObservers(){
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.triggerPlayBtn),
            name: Notification.Name("TriggerPlayBtn"),
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.changePlayImage),
            name: Notification.Name("ChangePlayImage"),
            object: nil)
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(kCONTENT_XIB_NAME, owner: self, options: nil)
        playBarView.fixInView(self)
    }
    
    @objc func triggerPlayBtn(notification: NSNotification){
        print("received notification in trigger \(PlayBar.currentlyPlaying)")
        if let dict = notification.object as? NSDictionary{
            PlayBar.playBtnManuallySelected = dict["play"] as? Bool ?? false
            playBtnAction(sender: playBtnOutlet)
        }
    }
    
    @objc func changePlayImage(notification: NSNotification){
        print("received notification playimage \(PlayBar.currentlyPlaying)")
        if PlayBar.currentlyPlaying{
            setButtonToSelected(sender: playBtnOutlet)
        } else{
            setButtonToUnSelected(sender: playBtnOutlet)
        }
    }
    
    func setButtonToSelected(sender : UIButton){
        print("setting image to true")
        sender.isSelected = true
        PlayBar.currentlyPlaying = true
        playBtnOutlet.setImage(UIImage(named: "pause"), for: .normal)
    }
    func setButtonToUnSelected(sender : UIButton){
        sender.isSelected = false
        PlayBar.currentlyPlaying = false
        playBtnOutlet.setImage(UIImage(named: "play"), for: .normal)
    }
    
    @objc func playBtnAction(sender: UIButton){
        
//        if let manuallySelectedPlay = PlayBar.playBtnManuallySelected{
//
//            //IF TRUE
////            if manuallySelectedPlay && PlayBar.currentWindow.isKind(of: FrequencyVC_UI.self){
//                setButtonToSelected(sender: sender)
//            //    FrequencyVC_UI.toneOutPutUnit.start()
//           // }
////            else if manuallySelectedPlay && PlayBar.currentWindow.isKind(of: SoundVC_UI.self){
//                setButtonToSelected(sender: sender)
//                SoundVC_UI.soundsCurrentlyPlaying.playAll()
//            //}
//                //IF FALSE
//            else if !manuallySelectedPlay{
//                setButtonToUnSelected(sender: sender)
//              //  FrequencyVC_UI.toneOutPutUnit.stop()
//                SoundVC_UI.soundsCurrentlyPlaying.stopAll()
//            }
        
    //    }
        //        else{
        //            sender.isSelected = !sender.isSelected
        //            currentlyPlaying = sender.isSelected
        //            if sender.isSelected{
        //                playBtnOutlet.setImage(UIImage(named: "pause"), for: .normal)
        //
        //                if PlayBar.currentWindow.isKind(of: SoundVC_UI.self){
        //                    SoundVC_UI.soundsCurrentlyPlaying.playAll()
        //                } else{
        //                    FrequencyVC_UI.toneOutPutUnit.start()
        //                }
        //
        //            } else {
        //                playBtnOutlet.setImage(UIImage(named: "play"), for: .normal)
        //                SoundVC_UI.soundsCurrentlyPlaying.stopAll()
        //                FrequencyVC_UI.toneOutPutUnit.stop()
        //            }
        //        }
        print("is currentlyplaying \(PlayBar.currentlyPlaying)")
        PlayBar.playBtnManuallySelected = nil
    }
    
    @IBAction func favoriteBtnAction(_ sender: Any) {
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
