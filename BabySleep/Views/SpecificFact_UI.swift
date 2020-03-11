//
//  SpecificFact_UI.swift
//  Tinnitus
//
//  Created by Marcus Thuvesen on 2019-08-30.
//  Copyright © 2019 Marcus Thuvesen. All rights reserved.
//

import UIKit

class SpecificFact_UI: UIViewController {

    @IBOutlet weak var specificFactTitleLabel: UILabel!
    @IBOutlet weak var specificFactTextView: UITextView!
    var factTitleText = ""
    var factTextViewText = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupSpecificFactUI()
    }
    
    func setupSpecificFactUI(){
        specificFactTitleLabel.text = factTitleText
        specificFactTextView.text = factTextViewText
    }
    
}
