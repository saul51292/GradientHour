//
//  countdownLabel.swift
//  GradientHour
//
//  Created by Saul on 1/9/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit

class countdownLabel: UIViewController, MZTimerLabelDelegate,BEMAnalogClockDelegate {

    
    @IBOutlet var countdownView: UIView!
    @IBOutlet var myCountdownLabel: UILabel!
    
    var backgroundLayer = Colors().gl
    let tapRec = UITapGestureRecognizer()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapRec.addTarget(self, action: "tappedTime")

            
            backgroundLayer.frame = view.frame
            view.layer.insertSublayer(backgroundLayer, atIndex: 0)

            
        var mycountdownTimer = MZTimerLabel(label: myCountdownLabel, andTimerType: MZTimerLabelTypeTimer)
        
        
        var timeToDealRefresh:NSTimeInterval = 20
        myCountdownLabel.addGestureRecognizer(tapRec)
        myCountdownLabel.userInteractionEnabled = true

        mycountdownTimer.timeLabel.textColor = UIColor.whiteColor()
        mycountdownTimer.setCountDownTime(timeToDealRefresh)
        mycountdownTimer.delegate = self
        mycountdownTimer.start()
    
        
    }
    
    func tappedTime(){
        addAnalog()
    }
    
    
    func addAnalog(){
        var myClock = BEMAnalogClockView(frame: CGRectMake(105, 100, 100, 100))
        myClock.delegate = self
        self.view.addSubview(myClock)
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
