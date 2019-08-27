//
//  ProgressIndicatorManager.swift
//  XServices
//
//  Created by K Saravana Kumar on 26/08/19.
//  Copyright © 2019 Securenext. All rights reserved.
//

import UIKit

class ProgressIndicatorManager {
    
    static let shared = ProgressIndicatorManager()
    
    var progressIndicator = SARMaterialDesignSpinner()
    var backgroundView = UIView()
    
    private init(){
        progressIndicator.lineWidth = 2.0
        progressIndicator.enableGoogleMultiColoredSpinner = false
        progressIndicator.strokeColor = UIColor.onboardingDotActiveColor()
        
        setupProgressIndicator()
    }
    
    func startAnimating(){
        if !progressIndicator.isAnimating {
            progressIndicator.startAnimating()
        }
        
    }
    
    func stopAnimating(){
        if progressIndicator.isAnimating {
            progressIndicator.stopAnimating()
        }
        
    }
    
    // MARK: - Private Methods
    fileprivate func setupProgressIndicator() {
        progressIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        
        let backgroundPadding: CGFloat = 30
        backgroundView = UIView(frame: CGRect(x: progressIndicator.frame.origin.x - backgroundPadding/2, y: progressIndicator.frame.origin.y - backgroundPadding/2, width: progressIndicator.frame.size.width + backgroundPadding, height: progressIndicator.frame.size.height + backgroundPadding))
        backgroundView.layer.cornerRadius = 10
        backgroundView.layer.masksToBounds = true
        progressIndicator.insertSubview(backgroundView, at: 0)
        backgroundView.backgroundColor = UIColor.darkGray
    }
    
}
