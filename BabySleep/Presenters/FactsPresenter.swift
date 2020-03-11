//
//  FactsPresenter.swift
//  Tinnitus
//
//  Created by Marcus Thuvesen on 2019-08-30.
//  Copyright © 2019 Marcus Thuvesen. All rights reserved.
//

import Foundation

protocol FactsDelegate : NSObjectProtocol{
    func displayText(specificTitleText : String, specificTextViewText : String)
}

class FactsPresenter{
    
    weak private var factsDelegate : FactsDelegate?
    private var provideFactText = ProvideFactText()
    
    func setPlayButtonUI(){
        print("check image")
        NotificationCenter.default.post(name: Notification.Name("ChangePlayImage"), object: nil)
    }
    
    func setFactsViewDelegate(factsDelegate : FactsDelegate){
        self.factsDelegate = factsDelegate
    }
    
    func factButtonSelected(buttonPressed : String){
        
        let (titleText, factText) = provideFactText.getCorrectText(buttonSelected: buttonPressed)
        
        self.factsDelegate?.displayText(specificTitleText: titleText, specificTextViewText: factText)
    }
    
}
