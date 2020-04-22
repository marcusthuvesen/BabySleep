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
        let thirdFactsText = "If your baby isn’t napping enough during the day, he or she will be more apt to wake up at the crack of dawn—or even before. Sleep needs vary by age, so find out what amount is likely best for your tot.\n\n*Adjust the Bedtime. Putting your baby to bed too late may actually lead to sleep deprivation and cause your child to wake up earlier than he or she is ready. Try putting your baby to bed 15 minutes earlier each night and see if he or she sleeps slightly later in the morning.\n\n*Do a Dream Feeding. If your baby is less than eight months old and you suspect that he or she is waking up before dawn because of hunger, try giving your child a bottle at about 11:00pm, taking care to rouse him as little as possible. This might be enough to stop any hunger pains from luring him awake all too early.\n\n*Keep it Pretty Dark. Lots of bright sunlight shining through the curtains at sunrise may be waking your baby up, so use blackout shades to keep the room dark and make it easier for your baby to stay asleep. But you don't want the room to be too dark. Plugging in a very dim nightlight may soothe a child who is afraid of the pitch black and help him or her see the familiar, comforting surroundings.\n\n*Block Out Noise. Sirens, a running shower, and even chirping birds can trigger your bundle of joy to rise and shine a bit too soon. Try using a sound conditioner, often called a white noise machine, to mask loud interruptions and help your baby associate that sound with sleep.\n\n*Keep Your Baby Comfortable. A wet or dirty diaper may be waking up your baby, so if this is a problem, try switching from regular diapers to overnight diapers. A room that’s too hot or too cold can also disrupt sleep, so keep the temperature between 65 and 70 degrees Fahrenheit. Adults generally need a cooler room (60 to 67 degrees) but smaller children are often more comfortable with a bit more warmth.\n\n*Let Him Be. Going to get your baby as soon as he or she wakes in the early morning hours may reinforce that it’s okay to get up at that time. Consider letting the child be for about 30 minutes and see if your baby can soothe himself or herself back to sleep. If your child is old enough to sit up, try placing a few soft toys in the crib, so that if your baby does wake up, he or she can play for a little while before possibly going back to sleep for a bit longer.\n\n*Set an Alarm. Think about using an alarm or a light with a timer on it and setting it for a more acceptable hour (say 6:00am, rather than 4:30am) to help your baby better understand when it is time to get up. Do not let your child get up for the day before the light or music alarm goes off or they will not take the timer seriously (though you might go in and tell them it’s not time to get up yet if they’re really crying)."
        
        return (thirdFactsTitle, thirdFactsText)
        
    }
    
}
