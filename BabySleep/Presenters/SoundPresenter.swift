//
//  SoundPresenter.swift
//  Tinnitus
//
//  Created by Marcus Thuvesen on 2019-09-05.
//  Copyright © 2019 Marcus Thuvesen. All rights reserved.
//

import Foundation
import UIKit

protocol SoundDelegate : NSObjectProtocol{
    func soundBtnSelected(senderOutlet : UIImageView, soundName : String)
    func soundBtnUnselected(senderOutlet : UIImageView, soundName : String)
    func changeSliderImage(sender : UIButton, senderOutlet: UIImageView, soundName : String)
    func removeSliderImage(senderOutlet : UIButton)
    func hideSliderContainer()
    func changeCountDownTime(timeString : String)
    func showAds()
    func showCountDownTimeView()
    func hideCountDownTimeView()
}

class SoundPresenter {
    weak private var soundDelegate : SoundDelegate?
    private var soundsCurrentlyPlaying = SoundsCurrentlyPlaying()
    private var audioNames = AudioFiles()
    private var firstSliderOutlet : UISlider?
    private var secondSliderOutlet : UISlider?
    private var thirdSliderOutlet : UISlider?
    private var adsCounter = 0
    
    func setSoundViewDelegate(soundDelegate : SoundDelegate){
        self.soundDelegate = soundDelegate
    }
    
    init() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.timeChanged),
            name: Notification.Name("TimeUpdate"),
            object: nil)
    }
    
    func soundButtonClicked(senderOutlet : UIImageView, sender: UIButton){
        sender.isSelected = !sender.isSelected
        let soundName = audioNames.provideAudioName(senderTag: sender.tag)
        
        if sender.isSelected{
            buttonClickedActions(sender : sender, senderOutlet : senderOutlet, soundName : soundName)
        } else {
            buttonUnClickedActions(sender : sender, senderOutlet : senderOutlet, soundName : soundName)
        }
    }
    
    func buttonClickedActions(sender : UIButton, senderOutlet : UIImageView, soundName : String){
        self.soundDelegate?.soundBtnSelected(senderOutlet : senderOutlet, soundName : soundName)
        self.soundDelegate?.changeSliderImage(sender : sender, senderOutlet : senderOutlet, soundName : soundName)
        soundsCurrentlyPlaying.saveCurrentSound(soundName: soundName)
        showAdWhenApproptiate()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: GlobalVariables.selectedNotification), object: nil)
        
    }
    
    func buttonUnClickedActions(sender : UIButton, senderOutlet : UIImageView, soundName : String){
        self.soundDelegate?.removeSliderImage(senderOutlet : sender)
        self.soundDelegate?.soundBtnUnselected(senderOutlet: senderOutlet, soundName: soundName)
        if !soundsCurrentlyPlaying.areSoundsPlaying(){
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: GlobalVariables.unselectedNotification), object: nil)
        }
    }
    
    
    func showAdWhenApproptiate(){
        adsCounter += 1
        if (adsCounter == 4 || adsCounter % 12 == 0) && !CheckSubscription.shared.checkUserSubscription(){
            self.soundDelegate?.showAds()
        }
    }
    
    @objc func timeChanged(notification: NSNotification) {
        self.soundDelegate?.showCountDownTimeView()
        if let dict = notification.object as? NSDictionary{
            let hour = dict["hour"] as! Int
            let minute = dict["minute"] as! Int
            let second  = dict["second"] as! Int
            reformatCountDownTime(hour: hour, minute: minute, second: second)
        }
    }
    
    func reformatCountDownTime(hour: Int, minute: Int, second: Int){
        var stringMinute = ""
        var stringSecond = ""
        var sleepTimeLabelText = ""
        if minute < 10 {
            stringMinute = String(minute)
            stringMinute = "0\(minute)"
        }else{
            stringMinute = String(minute)
        }
        if second < 10 {
            stringSecond = String(second)
            stringSecond = "0\(second)"
        }else{
            stringSecond = String(second)
        }
        if hour == 0{
            sleepTimeLabelText = "00:" + stringMinute + ":\(stringSecond)"
        }
        else if hour < 10{
            sleepTimeLabelText = "0\(hour):" + stringMinute + ":\(stringSecond)"
        }
        else{
            sleepTimeLabelText = "\(hour):" + stringMinute + ":\(stringSecond)"
        }
        self.soundDelegate?.changeCountDownTime(timeString: sleepTimeLabelText)
    }
    
    func howManySoundsPlaying(soundBtnOutlets : [UIButton]) -> Int {
        var amountOfActiveBtns = 0
        for outlet in soundBtnOutlets{
            if outlet.isSelected{
                amountOfActiveBtns += 1
            }
        }
        return amountOfActiveBtns
    }
    
    
    
    
    
    
}
