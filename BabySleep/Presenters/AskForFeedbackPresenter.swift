//
//  AskForFeedbackPresenter.swift
//  Tinnitus
//
//  Created by Marcus Thuvesen on 2019-09-29.
//  Copyright © 2019 Marcus Thuvesen. All rights reserved.
//

import Foundation
import FirebaseDatabase

protocol AskForFeedbackDelegate : NSObjectProtocol{
}

class AskForFeedbackPresenter{
    
    weak private var askForFeedbackDelegate : AskForFeedbackDelegate?
    
    func setFeedbackViewDelegate(askForFeedbackDelegate : AskForFeedbackDelegate){
        self.askForFeedbackDelegate = askForFeedbackDelegate
    }
    
    func sendFeedbackToFirebase(feedbackText : String){
        if feedbackText != ""{
            let db = FirebasePath.databaseRef.child("Feedback").childByAutoId()
            db.child("Feedback").setValue(feedbackText)
        }
        
    }

}
