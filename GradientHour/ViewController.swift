//
//  ViewController.swift
//  GradientHour
//
//  Created by Saul on 1/8/15.
//  Copyright (c) 2015 Saul. All rights reserved.
//

import UIKit




class ViewController: UIViewController {
    
    @IBOutlet var showTimer: UIButton!
    let colors = Colors()
    var backgroundLayer = Colors().gl
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        
        ///IF all deals expire show countdownlabelView
        
        backgroundLayer.frame = view.frame
        view.layer.insertSublayer(backgroundLayer, atIndex: 0)
        animateLayer()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
      
    
    func animateLayer() {
        
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
