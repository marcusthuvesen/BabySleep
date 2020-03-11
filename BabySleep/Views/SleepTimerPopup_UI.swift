//
//  SleepTimerPopup_UI.swift
//  Tinnitus
//
//  Created by Marcus Thuvesen on 2019-09-15.
//  Copyright © 2019 Marcus Thuvesen. All rights reserved.
//

import UIKit



class SleepTimerPopup_UI: UIViewController, SleepTimerPopupDelegate{
   

    @IBOutlet var shortcutOutlets: [UIButton]!
    @IBOutlet weak var timerDoneOutlet: UIButton!
    @IBOutlet weak var timePickerOutlet: UIDatePicker!
    @IBOutlet weak var sleepTimerContainerView: UIView!
    @IBOutlet weak var sleepTimeLabel: UILabel!
    @IBOutlet weak var stopWatchBackgroundView: UIView!
    @IBOutlet weak var stopWatchImage: UIView!
    
    let sleepTimerPopupDelegate = SleepTimerPopupPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSleepTimerUI()
        setupSleepTimerDelegate()
        hideKeyboardWhenTappedAround()
    }
    
    func setupSleepTimerDelegate(){
        print("setting up presenter")
        sleepTimerPopupDelegate.setSleepTimerViewDelegate(sleepTimerDelegate : self)
    }
    
    func setupSleepTimerUI(){
        for outlet in shortcutOutlets{ outlet.sleepTimerShortcutBtnUI() }
        timerDoneOutlet.premiumPopupContinueUI()
        timePickerOutlet.setValue(UIColor.white, forKeyPath: "textColor")
        sleepTimerContainerView.layer.cornerRadius = 20
        stopWatchBackgroundView.layer.cornerRadius = stopWatchBackgroundView.frame.height/2
        stopWatchImage.tintColor = UIView.CustomColors.transparentPink
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "HH:mm"
        if let date = dateFormatter.date(from: "00:00"){
            timePickerOutlet.date = date
        }
    }
    
   
    
    func showTimeLabel() {
        sleepTimeLabel.isHidden = false
    }
    
    func hideTimeLabel() {
        sleepTimeLabel.isHidden = true
    }
    
    func doneBtnText(btnText: String) {
        timerDoneOutlet.setTitle(btnText, for: .normal)
    }
    
    
    
    func updateTimerLabelUI(sleepLabelText: String) {
        sleepTimeLabel.text = sleepLabelText
    }
    
    func updateTimeEverySecond(sleepText : String) {
       sleepTimeLabel.text = sleepText
    }
    
    @IBAction func dismissTimerPopup(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func timerDoneBtn(_ sender: UIButton) {
        sleepTimerPopupDelegate.doneBtnSelected(sender: sender)
    }
    
    func dismissSleepTimerPopup(){
          self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sleepTimeChanged(_ sender: UIDatePicker) {
        sleepTimerPopupDelegate.timePickerChanged(datePicker : timePickerOutlet, sleepTimeLabel: sleepTimeLabel)
    }
    
    func shortcutBtnSelectedUI(sender: UIButton) {
        sender.normalTimerButtonSelected()
    }
    
    func shortcutBtnUnselectedUI(sender: UIButton) {
        sender.normalTimerButtonUI()
        sender.isSelected = false
    }
    
    @IBAction func shortcutBtns(_ sender: UIButton) {
        sleepTimerPopupDelegate.shortcutBtnSelected(sender: sender, sleepTimeLabel : sleepTimeLabel)
    }
    

}
