//
//  ServicesGradientButton.swift
//  XServices
//
//  Created by K Saravana Kumar on 26/08/19.
//  Copyright © 2019 Securenext. All rights reserved.
//

import UIKit

class ServicesGradientButton: UIButton {
    var gradientLayer:CAGradientLayer {
        return layer as! CAGradientLayer
    }
    
    override var isEnabled: Bool {
        didSet{
            updateStateUi()
        }
    }
    
    fileprivate func updateStateUi(){
        if isEnabled {
            GradientManager.sharedInstance.updateHorizontalGradient(self.gradientLayer, theme: ThemeManager.sharedInstance.gradientButtonTheme)
            
        } else {
            GradientManager.sharedInstance.updateHorizontalGradient(self.gradientLayer, theme: ThemeManager.sharedInstance.gradientButtonDisabledTheme)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        
        self.setTitleColor(UIColor.gray, for: .disabled)
        
        self.addUpperServicesShadow(to: self.gradientLayer)
        
        updateStateUi()
        
    }
}
