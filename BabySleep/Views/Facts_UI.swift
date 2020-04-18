//
//  FactsViewController.swift
//  Tinnitus
//
//  Created by Marcus Thuvesen on 2019-08-21.
//  Copyright © 2019 Marcus Thuvesen. All rights reserved.
//

import UIKit

class Facts_UI: UIViewController, FactsDelegate {
   
    @IBOutlet weak var firstFactBtnOutlet: UIButton!
    @IBOutlet weak var secondFactBtnOutlet: UIButton!
    @IBOutlet weak var thirdFactBtnOutlet: UIButton!
    @IBOutlet weak var firstFactView: UIView!
    @IBOutlet weak var secondFactView: UIView!
    @IBOutlet weak var thirdFactView: UIView!
    @IBOutlet weak var playBarContainerView: PlayBar!
    
    let factsPresenter = FactsPresenter()
    var specificFactTitleText = ""
    var specificFactText = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        setupFactUI()
        setupFactsDelegate()
    }
   
    func setupFactUI(){
//        firstFactBtnOutlet.imageView?.contentMode = UIView.ContentMode.scaleAspectFill
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        let bounds = self.navigationController!.navigationBar.bounds
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + 20)
        
        firstFactBtnOutlet.layer.cornerRadius = 50
        firstFactBtnOutlet.layer.maskedCorners = .layerMinXMaxYCorner
        secondFactBtnOutlet.layer.cornerRadius = 50
        secondFactBtnOutlet.layer.maskedCorners = .layerMinXMaxYCorner
        firstFactView.layer.cornerRadius = 50
        firstFactView.layer.maskedCorners = .layerMinXMinYCorner
        thirdFactView.layer.cornerRadius = 50
        thirdFactView.layer.maskedCorners = .layerMinXMaxYCorner
    }
    
    func setupFactsDelegate(){
        factsPresenter.setFactsViewDelegate(factsDelegate : self)
        
    }
    
    func displayText(specificTitleText: String, specificTextViewText : String) {
        pushToVC(specificTitleText: specificTitleText, specificTextViewText: specificTextViewText)
    }
    
    
    @IBAction func firstFactBtn(_ sender: UIButton) {
        factsPresenter.factButtonSelected(sender: sender)
    }
    
    func pushToVC(specificTitleText : String, specificTextViewText : String){
        
        specificFactTitleText = specificTitleText
        specificFactText = specificTextViewText
        self.performSegue(withIdentifier: "SpecificFact_UI_Segue", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SpecificFact_UI_Segue" {
            if let specificFactVC = segue.destination as? SpecificFact_UI {
                specificFactVC.factTitleText = specificFactTitleText
                specificFactVC.factTextViewText = specificFactText
            }
        }
    }
    
}
