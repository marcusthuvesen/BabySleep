//
//  SleepTimerPopupPresenter.swift
//  Tinnitus
//
//  Created by Marcus Thuvesen on 2019-09-16.
//  Copyright © 2019 Marcus Thuvesen. All rights reserved.
//

import Foundation
import UIKit

protocol SleepTimerPopupDelegate : NSObjectProtocol{
    func shortcutBtnSelectedUI(sender : UIButton)
    func shortcutBtnUnselectedUI(sender : UIButton)
    func updateTimerLabelUI(sleepLabelText : String)
    func updateTimeEverySecond(sleepText : String)
    func showTimeLabel()
    func hideTimeLabel()
    func doneBtnText(btnText : String)
    func dismissSleepTimerPopup()
}

class SleepTimerPopupPresenter{
    
    weak private var sleepTimerDelegate : SleepTimerPopupDelegate?
    static var sleepTimer = SleepTimer(sleepTimerPopupPresenter: SleepTimerPopupPresenter())
    static var doneBtnIsSelected = false
    private var latestOutlet : UIButton?
    private var setTime : (Int, Int)
    
    init(){
        setTime = (0, 0)
        if SleepTimerPopupPresenter.doneBtnIsSelected{
            print("Stop")
            sleepTimerDelegate?.doneBtnText(btnText: "Pause")
        }else{
            print("Done now")
            sleepTimerDelegate?.doneBtnText(btnText: "Done")
        }
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.timeChanged),
            name: Notification.Name("TimeUpdate"),
            object: nil)
    }
    
    
    @objc private func timeChanged(notification: NSNotification){
        //do stuff using the userInfo property of the notification object
        sleepTimerDelegate?.doneBtnText(btnText: "Stop")
        SleepTimerPopupPresenter.doneBtnIsSelected = true
        if let dict = notification.object as? NSDictionary{
            let hour = dict["hour"] as! Int
            let minute = dict["minute"] as! Int
            let second  = dict["second"] as! Int
            runUpdateTimeEverySecond(hour: hour, minute: minute, second: second)
        }
    }
    
    func setSleepTimerViewDelegate(sleepTimerDelegate : SleepTimerPopupDelegate){
        self.sleepTimerDelegate = sleepTimerDelegate
        //SleepTimerPopupPresenter.sleepTimer = SleepTimer(sleepTimerPopupPresenter: self)
    }
    
    func shortcutBtnSelected(sender : UIButton, sleepTimeLabel : UILabel){
        sender.isSelected = !sender.isSelected
        if sender.isSelected{
            self.sleepTimerDelegate?.shortcutBtnSelectedUI(sender : sender)
            unselectLatestOutlet(sender: sender)
            SleepTimerPopupPresenter.sleepTimer.stopTimer()
            SleepTimerPopupPresenter.doneBtnIsSelected = false
            sleepTimerDelegate?.doneBtnText(btnText: "Set Timer")
            sleepTimerDelegate?.showTimeLabel()
           
            switch sender.tag {
            case 0:
                sleepTimeLabel.text = "00:15:00"
                setTime = (0,15)
            case 1:
                sleepTimeLabel.text = "00:30:00"
                setTime = (0,30)
            case 2:
                sleepTimeLabel.text = "00:45:00"
                setTime = (0,45)
            case 3:
                sleepTimeLabel.text = "00:60:00"
                setTime = (0,60)
            default:
                sleepTimeLabel.text = "00:00:00"
            }
        } else {
            self.sleepTimerDelegate?.shortcutBtnUnselectedUI(sender : sender)
        }
    }
    
    func doneBtnSelected(sender : UIButton){
        SleepTimerPopupPresenter.doneBtnIsSelected = !SleepTimerPopupPresenter.doneBtnIsSelected
        if SleepTimerPopupPresenter.doneBtnIsSelected{
            sender.setTitle("Stop", for: .normal)
            let hour = setTime.0
            let minute = setTime.1
            SleepTimerPopupPresenter.sleepTimer.startTimer(hour: hour, minutes: minute)
            sleepTimerDelegate?.dismissSleepTimerPopup()
        } else {
            sender.setTitle("Set Timer", for: .normal)
            SleepTimerPopupPresenter.sleepTimer.stopTimer()
            sleepTimerDelegate?.hideTimeLabel()
        }
        
    }
    func timePickerChanged(datePicker : UIDatePicker, sleepTimeLabel : UILabel){
        SleepTimerPopupPresenter.sleepTimer.stopTimer()
        SleepTimerPopupPresenter.doneBtnIsSelected = false
        sleepTimerDelegate?.doneBtnText(btnText: "Set Timer")
        sleepTimerDelegate?.showTimeLabel()
        let date = datePicker.date
        _ = Calendar.current.dateComponents([.hour, .minute, .second], from: date)
        setTime = changeCountDownTimer(datePicker: datePicker, sleepTimeLabel: sleepTimeLabel)
        if latestOutlet != nil {
            unselectLatestOutlet(sender: latestOutlet!)
        }
    }
    
    func runUpdateTimeEverySecond(hour: Int, minute: Int, second: Int){
        var stringMinute = ""
        var stringSecond = ""
        sleepTimerDelegate?.showTimeLabel()
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
        self.sleepTimerDelegate?.updateTimeEverySecond(sleepText : sleepTimeLabelText)
    }
    
    func unselectLatestOutlet(sender : UIButton){
        if latestOutlet != nil{
            self.sleepTimerDelegate?.shortcutBtnUnselectedUI(sender : latestOutlet!)
        }
        latestOutlet = sender
    }
    
    
    
    func changeCountDownTimer(datePicker : UIDatePicker, sleepTimeLabel : UILabel) -> (Int, Int) {
        let date = datePicker.date
        let components = Calendar.current.dateComponents([.hour, .minute, .second], from: date)
        let hour = components.hour!
        let minute = components.minute!
        var stringMinute = ""
        if minute < 10 {
            stringMinute = String(minute)
            stringMinute = "0\(minute)"
        }else{
            stringMinute = String(minute)
        }
        if hour == 0{
            sleepTimeLabel.text = "00:" + stringMinute + ":00"
        }
        else if hour < 10{
            sleepTimeLabel.text = "0\(hour):" + stringMinute + ":00"
        }
        else{
            sleepTimeLabel.text = "\(hour):" + stringMinute + ":00"
        }
        return (hour, minute)
    }
    
    
}
