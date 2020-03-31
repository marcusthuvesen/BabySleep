//
//  Sound_ViewController.swift
//  Tinnitus
//
//  Created by Marcus Thuvesen on 2019-08-07.
//  Copyright © 2019 Marcus Thuvesen. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer
import Firebase

class SoundVC_UI: UIViewController, SoundDelegate{
    
    @IBOutlet weak var bgGradientView: UIView!
    //Button Outlets
    @IBOutlet var soundBtnOutlets: [UIButton]!
    //BackgroundImages Outlets
    @IBOutlet var btnBackgroundImages: [UIImageView]!
    //Menu Outlets
    @IBOutlet weak var menuBtnOne: UIButton!
    @IBOutlet weak var menuBtnTwo: UIButton!
    @IBOutlet weak var menuBtnThree: UIButton!
    //Volume Outlets
    @IBOutlet weak var soundVolumeView: UIView!
    //Slider Outlets
    @IBOutlet weak var firstSliderOutlet: UISlider!
    @IBOutlet weak var secondSliderOutlet: UISlider!
    @IBOutlet weak var thirdSliderOutlet: UISlider!
    @IBOutlet weak var soundScrollView: UIScrollView!
    @IBOutlet weak var favoriteLabel: UILabel!
    @IBOutlet weak var mechanicLabel: UILabel!
    @IBOutlet weak var natureLabel: UILabel!
    
    @IBOutlet weak var playBarContainerView: PlayBar!
    var defaultThumbImage : UIImage?
    
    let soundPresenter = SoundPresenter()
    var previousThirdSender : UIButton?
    var previousThirdSoundName : String?
    var previousThirdOutlet : UIImageView?
    static var soundsCurrentlyPlaying = SoundsCurrentlyPlaying()
    var firstSliderSoundName : String?
    var secondSliderSoundName : String?
    var thirdSliderSoundName : String?
    static let soundVC = SoundVC_UI()
    
    override func viewWillAppear(_ animated: Bool) {
        PlayBar.currentWindow = self
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSoundVC_UI()
        setupSoundDelegate()
        defaultThumbImage = firstSliderOutlet.currentThumbImage
        hideKeyboardWhenTappedAround()
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
        bgGradientView.layer.addSublayer(gradientLayer)
    }
    
    func setupSoundDelegate(){
        soundPresenter.setSoundViewDelegate(soundDelegate: self)
    }
    
    func hideSliderContainer() {
        if !SoundVC_UI.soundsCurrentlyPlaying.areSoundsPlaying(){
            let top = CGAffineTransform(translationX: 0, y: +60)
            UIView.animate(withDuration: 0.4, delay: 0.0, options: [], animations: {
                self.soundVolumeView.transform = top
            }, completion: {_ in
                self.soundVolumeView.isHidden = true
            })
            
        }
    }
    
    func showSliderContainer(){
        if soundVolumeView.isHidden{
            soundVolumeView.isHidden = false
            let top = CGAffineTransform(translationX: 0, y: -60)
            UIView.animate(withDuration: 0.4, delay: 0.0, options: [], animations: {
                self.soundVolumeView.transform = top
            }, completion: nil)
            
        }
    }
    
    func setupSoundVC_UI(){
        
        for image in btnBackgroundImages{
            image.normalButtonUI()
        }
        
        menuBtnOne.menuBtnUI()
        menuBtnTwo.menuBtnUI()
        menuBtnThree.menuBtnUI()
    }
    
    func soundBtnSelected(senderOutlet : UIImageView, soundName : String) {
        senderOutlet.normalButtonIsClickedUI()
        showSliderContainer()
        SoundVC_UI.soundsCurrentlyPlaying.playSound(fileName: soundName)
    }
    
    func soundBtnUnselected(senderOutlet : UIImageView, soundName : String) {
        senderOutlet.backgroundColor = UIView.CustomColors.blue
        SoundVC_UI.soundsCurrentlyPlaying.stopSound(stopFileName: soundName)
        hideSliderContainer()
    }
    
    func checkNumberOfEmptySliders() -> Int{
        var firstEmptySpot = 0
        
        if firstSliderOutlet?.currentThumbImage == defaultThumbImage{
            firstEmptySpot = 1
        }
        else if secondSliderOutlet?.currentThumbImage == defaultThumbImage{
            firstEmptySpot = 2
        }
        else if thirdSliderOutlet?.currentThumbImage == defaultThumbImage{
            firstEmptySpot = 3
        }
        return firstEmptySpot
    }
    
    func changeSliderImage(sender: UIButton, senderOutlet: UIImageView, soundName : String) {
        let checkEmptySlider = checkNumberOfEmptySliders()
        var senderImage = sender.image(for: .normal)
        senderImage = senderImage?.resize(toWidth: 40)
        senderImage = senderImage?.imageWithColor(color: UIView.CustomColors.pink)
        switch checkEmptySlider {
        case 1:
            firstSliderOutlet.setThumbImage(senderImage, for: .normal)
            firstSliderOutlet.tag = sender.tag
            firstSliderSoundName = soundName
        case 2:
            secondSliderOutlet.setThumbImage(senderImage, for: .normal)
            secondSliderOutlet.tag = sender.tag
            secondSliderSoundName = soundName
        case 3:
            thirdSliderOutlet.setThumbImage(senderImage, for: .normal)
            thirdSliderOutlet.tag = sender.tag
            thirdSliderSoundName = soundName
            setPreviousThirdInputs(sender: sender, senderOutlet: senderOutlet, soundName: soundName)
        default:
            
            if previousThirdOutlet != nil {
                soundBtnUnselected(senderOutlet: previousThirdOutlet!, soundName: previousThirdSoundName!)
                previousThirdSender?.isSelected = false
                removeSliderImage(senderOutlet: previousThirdSender!)
            }
            
            thirdSliderOutlet.setThumbImage(senderImage, for: .normal)
            thirdSliderSoundName = soundName
            thirdSliderOutlet.tag = sender.tag
            setPreviousThirdInputs(sender: sender, senderOutlet: senderOutlet, soundName: soundName)
        }
    }
    
    func setPreviousThirdInputs(sender: UIButton, senderOutlet: UIImageView, soundName : String ){
        previousThirdSender = sender
        previousThirdOutlet = senderOutlet
        previousThirdSoundName = soundName
    }
    
    func removeSliderImage(senderOutlet : UIButton){
        
        if firstSliderOutlet.tag == senderOutlet.tag{
            firstSliderOutlet.setThumbImage(defaultThumbImage, for: .normal)
            firstSliderSoundName = nil
            firstSliderOutlet.tag = 0
        }else if secondSliderOutlet.tag == senderOutlet.tag{
            secondSliderOutlet.setThumbImage(defaultThumbImage, for: .normal)
            secondSliderSoundName = nil
            secondSliderOutlet.tag = 0
        }else if thirdSliderOutlet.tag == senderOutlet.tag{
            thirdSliderOutlet.setThumbImage(defaultThumbImage, for: .normal)
            thirdSliderSoundName = nil
            thirdSliderOutlet.tag = 0
        }
    }
   
    func showSleepTimerPopup(){
        presentPopup(UIStoryboardName: "SleepTimerPopup", WithIdentifier: "SleepTimerPopup_UI", tabBarController: tabBarController ?? nil)
    }
    
    @IBAction func firstSoundBtn(_ sender: UIButton) {
        soundPresenter.soundButtonClicked(senderOutlet: btnBackgroundImages[sender.tag-1], sender: sender)
    }

    @IBAction func firstSliderAction(_ sender: UISlider) {
        SoundVC_UI.soundsCurrentlyPlaying.changeVolumeOnSound(soundName: firstSliderSoundName, newValue: sender.value)
    }
    
    @IBAction func secondSliderAction(_ sender: UISlider) {
        SoundVC_UI.soundsCurrentlyPlaying.changeVolumeOnSound(soundName: secondSliderSoundName, newValue: sender.value)
    }
    
    @IBAction func thirdSliderAction(_ sender: UISlider) {
        SoundVC_UI.soundsCurrentlyPlaying.changeVolumeOnSound(soundName: thirdSliderSoundName, newValue: sender.value)
    }
    
    func sendToPopup(){
        presentPopup(UIStoryboardName: "PremiumPopup", WithIdentifier: "PremiumPopup_UI", tabBarController: tabBarController ?? nil)
    }
    
    func sendToFavoritePopup(){
        presentPopup(UIStoryboardName: "NewFavoritePopup", WithIdentifier: "NewFavoritePopup", tabBarController: tabBarController ?? nil)
    }
    
    @IBAction func menuBtnOne(_ sender: Any) {
        self.soundScrollView.scrollToView(view: self.natureLabel, animated: true)
    }
    
    @IBAction func menuBtnTwo(_ sender: Any) {
        self.soundScrollView.scrollToView(view: self.mechanicLabel, animated: true)
    }
    
    @IBAction func menuBtnThree(_ sender: Any) {
        self.soundScrollView.scrollToView(view: self.favoriteLabel, animated: true)
    }
    
}


extension UIScrollView {
    
    // Scroll to a specific view so that it's top is at the top our scrollview
    func scrollToView(view:UIView, animated: Bool) {
        if let origin = view.superview {
            // Get the Y position of your child view
            let childStartPoint = origin.convert(view.frame.origin, to: self)
            // Scroll to a rectangle starting at the Y of your subview, with a height of the scrollview
            self.scrollRectToVisible(CGRect(x:0, y:childStartPoint.y,width: 1,height: self.frame.height), animated: animated)
        }
    }
    
    // Bonus: Scroll to top
    func scrollToTop(animated: Bool) {
        let topOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(topOffset, animated: animated)
    }
    
    // Bonus: Scroll to bottom
    func scrollToBottom() {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height + contentInset.bottom)
        if(bottomOffset.y > 0) {
            setContentOffset(bottomOffset, animated: true)
        }
    }
    
}

extension UIImage {
    func resize(toWidth width: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }

    func imageWithColor(color: UIColor) -> UIImage? {
        var image = withRenderingMode(.alwaysTemplate)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        color.set()
        image.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
