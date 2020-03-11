//
//  FactsTextInfo.swift
//  Tinnitus
//
//  Created by Marcus Thuvesen on 2019-08-30.
//  Copyright © 2019 Marcus Thuvesen. All rights reserved.
//

import Foundation

class ProvideFactText{
   
    func getCorrectText(buttonSelected : String) -> (String, String){
        
        var textToSendBack : (String, String)
        
        switch buttonSelected {
        case "First":
           textToSendBack = fetchFirstText()
        case "Second":
           textToSendBack = fetchSecondText()
        case "Third":
           textToSendBack = fetchThirdText()
        case "Fourth":
           textToSendBack = fetchFourthText()
        default:
          textToSendBack = fetchFirstText()
        }
        
        return textToSendBack
    }
    
    func fetchFirstText() -> (String, String){
        let firstFactsTitle = "The cause of tinnitus"
        let firstFactsText = "A number of health conditions can cause or worsen tinnitus. In many cases, an exact cause is never found. A common cause of tinnitus is inner ear hair cell damage. Tiny, delicate hairs in your inner ear move in relation to the pressure of sound waves. This triggers cells to release an electrical signal through a nerve from your ear (auditory nerve) to your brain. Your brain interprets these signals as sound. If the hairs inside your inner ear are bent or broken, they can leak random electrical impulses to your brain, causing tinnitus.\n\nOther causes of tinnitus include other ear problems, chronic health conditions, and injuries or conditions that affect the nerves in your ear or the hearing center in your brain."
        
        return (firstFactsTitle, firstFactsText)
    }
    
    func fetchSecondText() -> (String, String){
        let secondFactsTitle = "To live with tinnitus"
        let secondFactsText = "Living with tinnitus can be difficult. Treatment and coping strategies can help. How to live with tinnitus. Here is some simple advice which may help you cope with the constant noise of tinnitus also known as ringing ears: Avoid anxiety or stress, as these stimulate an already sensitive hearing system. \n\n*Have adequate rest and avoid fatigue.\n\n*Avoid the use of stimulants to the nervous system, including coffee (caffeine), alcohol, and smoking (nicotine).\n\n*Sleep with your head propped up in an elevated position. This may usually be accomplished with the use of one or two extra pillows. This lessens head congestion, and tinnitus may become less noticeable.\n\n*Be aware that tinnitus is usually more noticeable after retiring for the night and the surroundings are quieter. Any noise in the room, such as a ticking clock or softly playing radio, helps to mask tinnitus and make it less irritating.\n\n*Use a tinnitus masker if you find this helpful\n\n*Some people benefit by using a hearing aid as it amplifies outside noise (like masking)/n/n*Avoid situations that can further damage hearing (excessive noise), and protect your ears from injury and occupational hazards. Use protective ear wear when appropriate.\n\n*Some people receive considerably relief in alternative therapies/n/n*Counseling may be beneficial, especially if people are afraid that they have a serious or progressive disease, such as a brain tumor. Some people worry they may have a mental illness, because the noise is in their head. Reassurance by a specialist helps to calm such fears and anxieties."
        return (secondFactsTitle, secondFactsText)
    }
    
    func fetchThirdText() -> (String, String){
        let thirdFactsTitle = "Can it be cured?"
        let thirdFactsText = "Occasionally, the cause of tinnitus can be treated. For instance, if the noise in the ears is caused by a middle ear infection, antibiotics may solve the problem."
        return (thirdFactsTitle, thirdFactsText)
    
    }
    func fetchFourthText() -> (String, String){
        let fourthFactsTitle = "Prevent more tinnitus"
        let fourthFactsText = "To treat your tinnitus, your doctor will first try to identify any underlying, treatable condition that may be associated with your symptoms. If tinnitus is due to a health condition, your doctor may be able to take steps that could reduce the noise. Examples include:\n\n*Earwax removal. Removing impacted earwax can decrease tinnitus symptoms.\n\n*Treating a blood vessel condition. Underlying vascular conditions may require medication, surgery or another treatment to address the problem.\n\n*Changing your medication. If a medication you're taking appears to be the cause of tinnitus, your doctor may recommend stopping or reducing the drug, or switching to a different medication."
        return (fourthFactsTitle,fourthFactsText)
    }
    
}
