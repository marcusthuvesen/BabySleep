//
//  FactsPresenter.swift
//  Tinnitus
//
//  Created by Marcus Thuvesen on 2019-08-30.
//  Copyright © 2019 Marcus Thuvesen. All rights reserved.
//

import Foundation
import UIKit

protocol FactsDelegate : NSObjectProtocol{
    func displayText(specificTitleText : String, specificTextViewText : String)
}

class FactsPresenter{
    
    weak private var factsDelegate : FactsDelegate?
    private var provideFactText = ProvideFactText()
    
    func setFactsViewDelegate(factsDelegate : FactsDelegate){
        self.factsDelegate = factsDelegate
    }
    
    func factButtonSelected(sender : UIButton){
        
        let (titleText, factText) = provideFactText.getCorrectText(buttonSelected: sender.tag)
        
        self.factsDelegate?.displayText(specificTitleText: titleText, specificTextViewText: factText)
    }
    
}
