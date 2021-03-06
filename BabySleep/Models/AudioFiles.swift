//
//  AudioFiles.swift
//  Tinnitus
//
//  Created by Marcus Thuvesen on 2019-09-05.
//  Copyright © 2019 Marcus Thuvesen. All rights reserved.
//

import Foundation


struct AudioFiles {
    
    func provideAudioName(senderTag : Int) -> String{
        var soundName = ""
        switch senderTag {
        case 1:
            soundName = "rain"
        case 2:
            soundName = "beachWaves"
        case 3:
            soundName = "cicadas"
        case 4:
            soundName = "wavesFlood"
        case 5:
            soundName = "fire"
        case 6:
            soundName = "thunder"
        case 7:
            soundName = "bird"
        case 8:
            soundName = "wind"
        case 9:
            soundName = "waterfall2"
        case 10:
           soundName = "snow"
        case 11:
           soundName = "cat"
        case 12:
           soundName = "seagull"
        case 13:
           soundName = "train"
        case 14:
            soundName = "airliner"
        case 15:
            soundName = "crowd"
        case 16:
            soundName = "highway"
        case 17:
            soundName = "coffee"
        case 18:
            soundName = "city"
        case 19:
            soundName = "bus"
        case 20:
            soundName = "bicycle"
        case 21:
            soundName = "heels"
        case 22:
            soundName = "clock"
        case 23:
            soundName = "vacuumCleaner"
        case 24:
            soundName = "shower"
        case 25:
            soundName = "radioBuzz"
        case 26:
            soundName = "dishwasher"
        case 27:
            soundName = "fan"
        case 28:
            soundName = "babyLullaby_1"
        case 29:
            soundName = "SweetDreams"
        case 30:
            soundName = "babyLullaby_3"
        case 31:
            soundName = "NightTimeLullaby"
        case 32:
            soundName = "SleepMusic"
        case 33:
            soundName = "SleepingTunes"
        default:
           soundName = "rain"
        }
        return soundName
    }
}

