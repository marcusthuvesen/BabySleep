//
//  SleepTimer.swift
//  Tinnitus
//
//  Created by Marcus Thuvesen on 2019-09-17.
//  Copyright © 2019 Marcus Thuvesen. All rights reserved.
//

import Foundation



class SleepTimer{
    var counter = 0
    private weak var sleepTimer : Timer?
    var sleepTimerPopupPresenter : SleepTimerPopupPresenter?
    
    init(sleepTimerPopupPresenter : SleepTimerPopupPresenter) {
        self.sleepTimerPopupPresenter = sleepTimerPopupPresenter
    }
    
    func startTimer(hour : Int, minutes : Int){
        stopTimer()
        counter = reformatToSeconds(hour: hour, minutes: minutes)
        if sleepTimer == nil {
            sleepTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        }
    }
    
    func reformatToSeconds(hour : Int, minutes : Int) -> Int{
        var seconds = 0
        let hourSeconds = hour * 3600
        let minuteSeconds = minutes * 60
        seconds = hourSeconds + minuteSeconds
        return seconds
    }
    
    func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    func stopTimer(){
        
        if sleepTimer != nil{
            print("Invalidating timer")
            sleepTimer!.invalidate()
            sleepTimer = nil
        }
        counter = 0
    }

    @objc func updateCounter() {
        //example functionality
        if counter > 0 {
            print("\(counter) seconds until pause")
            counter -= 1
            
        } else {
            print("\(counter) seconds until pause")
            SoundVC_UI.soundsCurrentlyPlaying.stopAll()
            //FrequencyVC_UI.toneOutPutUnit.stop()
            stopTimer()
        }
        let (hour, minute, second) = secondsToHoursMinutesSeconds(seconds: counter)
//        self.sleepTimerDelegate?.updateTimeEverySecond(hour: hour, minute: minute, second: second)
//        test()

        let timeDict = ["hour": hour, "minute" : minute, "second" : second]

        NotificationCenter.default.post(name: Notification.Name("TimeUpdate"), object: timeDict)
        sleepTimerPopupPresenter?.runUpdateTimeEverySecond(hour: hour, minute: minute, second: second)
    }
   
}
