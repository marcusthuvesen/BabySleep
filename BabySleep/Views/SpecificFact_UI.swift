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
    @IBOutlet weak var bgGradientSpecificFactView: UIView!
    
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
        gradientBackground()
    }
    
    func gradientBackground(){
        // Create a gradient layer.
        let gradientLayer = CAGradientLayer()
        // Set the size of the layer to be equal to size of the display.
        gradientLayer.frame = view.bounds
        // Set an array of Core Graphics colors (.cgColor) to create the gradient.
        // This example uses a Color Literal and a UIColor from RGB values.
        gradientLayer.colors = [#colorLiteral(red: 0.6274509804, green: 0.3647058824, blue: 0.462745098, alpha: 1).cgColor, #colorLiteral(red: 0.2941176471, green: 0.1647058824, blue: 0.5607843137, alpha: 1).cgColor]
        // Rasterize this static layer to improve app performance.
        gradientLayer.shouldRasterize = true
        // Apply the gradient to the backgroundGradientView.
        bgGradientSpecificFactView.layer.addSublayer(gradientLayer)
    }
    
}
