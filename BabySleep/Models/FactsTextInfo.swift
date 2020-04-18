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
        case 3:
            textToSendBack = fetchFourthText()
        default:
            textToSendBack = fetchFirstText()
        }
        
        return textToSendBack
    }
    
    func fetchFirstText() -> (String, String){
        let firstFactsTitle = "The cause of tinnitus"
        let firstFactsText = "A number of health conditions can cause tinnitus. In many cases, an exact cause is never found. A common cause is inner ear hair cell damage. Tiny, hairs in your inner ear move in relation to the pressure of sound waves. This triggers electrical signals through an auditory nerve from your ear to your brain. Your brain interprets these signals as sound. If the hairs inside your inner ear are bent or broken, they can leak random electrical impulses to your brain, causing tinnitus.\n\nOther causes of tinnitus include other ear problems, chronic health conditions, and injuries or conditions that affect the nerves in your ear or the hearing center in your brain. "
        
        return (firstFactsTitle, firstFactsText)
    }
    
    func fetchSecondText() -> (String, String){
        let secondFactsTitle = "To live with tinnitus"
        let secondFactsText = "Living with tinnitus can be very difficult. Treatment and coping strategies can help. Here are some tips which may help you cope with the constant noise of tinnitus: Avoid anxiety or stress, as these can stimulate an already sensitive hearing system. \n\n* Have adequate rest.\n\n* Try to avoid the use of stimulants to the nervous system, including coffee (caffeine), alcohol, and smoking (nicotine).\n\n* Use one or two pillows to sleep with your head in an elevated position. Tinnitus may become less noticeable.\n\n* Tinnitus is more noticeable after retiring for the night and the surroundings are quieter. Any continues low noise in the room helps to mask tinnitus and make it less irritating. Try TinAid masking background sounds.\n\n* Some people successfully reduce the experienced tinnitus noise with hearing aid as it amplifies outside noise/n/n* Avoid situations that can further damage hearing like concerts, festivals etc. if you don't use protective ear wear.\n\n* There is numerous facebook groups to join with tinnitus sufferers around the world. Some people find it helpful to share their experience and help others."
        
        return (secondFactsTitle, secondFactsText)
    }
    
    func fetchThirdText() -> (String, String){
        let thirdFactsTitle = "Can it be cured?"
        let thirdFactsText = "Occasionally, the cause of tinnitus can be treated. For instance, if the noise in the ears is caused by a middle ear infection, antibiotics may solve the problem.\n\nUnfortunately for most people the tinnitus is permanent, however some people can experience temporary relief from various exercises. We highly recommend testing the tinnitus matcher and head tapping technique."
        return (thirdFactsTitle, thirdFactsText)
        
    }
    func fetchFourthText() -> (String, String){
        let fourthFactsTitle = "Prevent more tinnitus"
        let fourthFactsText = "To treat your tinnitus, your doctor will first try to identify any underlying, treatable condition that may be associated with your symptoms. It is always recommended to not listen to high volume music or expose the ears to continuous high volume sounds.\n\nTinnitus may come due to a health condition. If so, your doctor may be able to take steps that could reduce the noise in your ears.\n\n Examples include:\n\n* Earwax removal. Removing earwax can decrease tinnitus symptoms in some cases.\n\n* Treating a blood vessel condition. Underlying vascular conditions may require medication, surgery or another treatment to address the problem.\n\n* Changing medications. If you take medications that appears to be the cause of your tinnitus, your doctor may recommend stopping or reducing the drug, or switching to a different medication."
        return (fourthFactsTitle, fourthFactsText)
    }
    
}
