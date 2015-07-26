//
//  ViewController.swift
//  GradientHour
//
//  Created by Saul on 1/8/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var animatingLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    var stringAMorPM:String!
    let colors = Colors()
    var backgroundLayer = Colors().gl
    var hour:Int!
    var myHourString:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundLayer.frame = view.frame
        view.layer.insertSublayer(backgroundLayer, atIndex: 0)
        hour = colors.getHourOfDay()
        animateLayer()
        plusButton.imageView!.contentMode = .ScaleAspectFill
        minusButton.imageView!.contentMode = .ScaleAspectFill
        self.animatingLabel.alpha = 0

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getTime(){
        switch(hour){
        case 1...11:
            myHourString = String(hour)
            stringAMorPM = "AM"
        case 13...23:
            myHourString = String(hour - 12)
            stringAMorPM = "PM"
        case 12:
            myHourString = String(hour)
            if(stringAMorPM == "PM"){
                stringAMorPM = "AM"
            }else{
                stringAMorPM = "PM"
            }
        case 24:
            myHourString = String(hour-12)
            if(stringAMorPM == "PM"){
                stringAMorPM = "AM"
            }else{
                stringAMorPM = "PM"
            }
        default:
            hour = 1
            myHourString = String(hour)
            stringAMorPM = "AM"
        }
        timeLbl.text = "\(myHourString) \(stringAMorPM)"

    }
    
    
    func enableButtons(){
        plusButton.userInteractionEnabled = true
        minusButton.userInteractionEnabled = true
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.activityIndicator.stopAnimating()
            self.animatingLabel.alpha = 0
        })
        
    }
    
    func disableButtons(){
        plusButton.userInteractionEnabled = false
        minusButton.userInteractionEnabled = false
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.animatingLabel.alpha = 1
            self.activityIndicator.startAnimating()
        })

        NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "enableButtons", userInfo: nil, repeats: false)
    }

    @IBAction func addHour(sender: AnyObject) {
        hour = hour + 1
        colors.hour = hour
        animateLayer()
        disableButtons()
    }
    
    @IBAction func minusHour(sender: AnyObject) {
        hour = hour - 1
        colors.hour = hour
        animateLayer()
        disableButtons()
    }
    
    func animateLayer() {
        getTime()
        var array = backgroundLayer.colors
        colors.setArrays()
        backgroundLayer.colors = colors.toArray
        var animation = CABasicAnimation (keyPath: "colors")
        
        animation.fromValue = array
        animation.toValue = colors.toArray
        animation.duration = 3.00
        animation.removedOnCompletion = true
        animation.fillMode = kCAFillModeForwards
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.delegate = self
        
        backgroundLayer.addAnimation(animation, forKey: "animateGradient")
        
    }
    
}
