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
    @IBOutlet weak var fourthFactBtnOutlet: UIButton!
    @IBOutlet weak var playBarContainerView: PlayBar!
    
    let factsPresenter = FactsPresenter()
    var specificFactTitleText = ""
    var specificFactText = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        setupFactUI()
        setupFactsDelegate()
    }
    override func viewDidAppear(_ animated: Bool) {
        factsPresenter.setPlayButtonUI()
    }
    
    func setupFactUI(){
//        firstFactBtnOutlet.imageView?.contentMode = UIView.ContentMode.scaleAspectFill
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        let bounds = self.navigationController!.navigationBar.bounds
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + 20)
    }
    
    func setupFactsDelegate(){
        factsPresenter.setFactsViewDelegate(factsDelegate : self)
        
    }
    
    func displayText(specificTitleText: String, specificTextViewText : String) {
        pushToVC(specificTitleText: specificTitleText, specificTextViewText: specificTextViewText)
    }
    
    
    @IBAction func firstFactBtn(_ sender: Any) {
        factsPresenter.factButtonSelected(buttonPressed: "First")
    }
    @IBAction func secondFactBtn(_ sender: Any) {
        factsPresenter.factButtonSelected(buttonPressed: "Second")
        
    }
    @IBAction func thirdFactBtn(_ sender: Any) {
        factsPresenter.factButtonSelected(buttonPressed: "Third")
        
    }
    @IBAction func fourthFactBtn(_ sender: Any) {
        factsPresenter.factButtonSelected(buttonPressed: "Fourth")
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
