//
//  FactsTextInfo.swift
//  Tinnitus
//
//  Created by Marcus Thuvesen on 2019-08-30.
//  Copyright © 2019 Marcus Thuvesen. All rights reserved.
//

import Foundation

class ProvideFactText{
    
    func getCorrectText(buttonSelected : Int) -> (String, String){
        
        var textToSendBack : (String, String)
        
        switch buttonSelected {
        case 0:
            textToSendBack = fetchFirstText()
        case 1:
            textToSendBack = fetchSecondText()
        case 2:
            textToSendBack = fetchThirdText()
        default:
            textToSendBack = fetchFirstText()
        }
        
        return textToSendBack
    }
    
    func fetchFirstText() -> (String, String){
        let firstFactsTitle = "Make your baby tired"
        let firstFactsText = "* During the day, allow plenty of sunlight into the house or take him outside. Put your baby down for daytime naps in a well-lit room (unless he has trouble falling asleep at nap time).\n\n* To induce nighttime sleepiness, consider installing dimmers on the lights in your baby's room, but also in other rooms where you both spend lots of time. Lower the lights in the evening (up to two hours before bedtime) to set the mood.\n\n* It's fine to use a night-light in his room, but choose a small, dim one that stays cool to the touch. (Don't plug it in near bedding or drapes.)\n\n* If your child wakes up during the night, don't turn on the lights or carry him into a brightly lit room. The shift from dark to light tells his brain it's go time. Instead, soothe him back to sleep in his dark bedroom.\n\n* If early morning sunlight prompts your child to wake too early, or if he has trouble napping in the afternoon, consider installing room-darkening shades."
        
        return (firstFactsTitle, firstFactsText)
    }
    
    func fetchSecondText() -> (String, String){
        let secondFactsTitle = "Putting baby to bed"
        let secondFactsText = "Training your baby to self soothe and sleep through the night is made possible through a technique called “wake and sleep.”\n\n*Here’s how to sleep train your infant with this method:\n\n*Every evening at bedtime, swaddle your little one, turn on rough white noise as loud as a shower, feed and burp her, let her fall asleep in your arms and then lay her down.\n\n*BUT, right after you slide your munchkin into bed, rouse her until her eyes open (tickle her neck, scratch her feet, etc).\n\n*After a few seconds she will close her eyes again and she’ll slide back into slumberland.\n\n*If she fusses, she may be hungry or uncomfortable, so pick her up to feed and calm her, but be sure to wake her again when you put her back down.\n\n*I know it sounds crazy, but those few seconds of drowsy waking are the first baby steps to helping your infant learn how to sleep through the night!"
        
        return (secondFactsTitle, secondFactsText)
    }
    
    func fetchThirdText() -> (String, String){
        let thirdFactsTitle = "Make baby sleep longer"
        let thirdFactsText = "If your baby isn’t napping enough during the day, he or she will be more apt to wake up at the crack of dawn—or even before. Sleep needs vary by age, so find out what amount is likely best for your tot.\n\n*Adjust the Bedtime. Putting your baby to bed too late may actually lead to sleep deprivation and cause your child to wake up earlier than he or she is ready. Try putting your baby to bed 15 minutes earlier each night and see if he or she sleeps slightly later in the morning.\n\n*Block Out Noise. Sirens, a running shower, and even chirping birds can trigger your bundle of joy to rise and shine a bit too soon. Try using a sound conditioner, often called a white noise machine, to mask loud interruptions and help your baby associate that sound with sleep.\n\n*Keep Your Baby Comfortable. A room that’s too hot or too cold can also disrupt sleep, so keep the temperature between 65 and 70 degrees Fahrenheit. Adults generally need a cooler room (60 to 67 degrees) but smaller children are often more comfortable with a bit more warmth.\n\n*Let Him Be. Going to get your baby as soon as he or she wakes in the early morning hours may reinforce that it’s okay to get up at that time. \n\n*Set an Alarm. Think about using an alarm or a light with a timer on it and setting it for a more acceptable hour (say 6:00am, rather than 4:30am) to help your baby better understand when it is time to get up. Do not let your child get up for the day before the light or music alarm goes off or they will not take the timer seriously."
        
        return (thirdFactsTitle, thirdFactsText)
        
    }
    
}
