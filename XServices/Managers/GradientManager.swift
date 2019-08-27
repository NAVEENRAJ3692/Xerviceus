//
//  GradientManager.swift
//  XServices
//
//  Created by K Saravana Kumar on 26/08/19.
//  Copyright © 2019 Securenext. All rights reserved.
//

import UIKit

class GradientManager {
    static let sharedInstance = GradientManager()

    
    func updateHorizontalGradient(_ layer:CAGradientLayer, theme: Theme){
        
        layer.startPoint = CGPoint(x: 0.0, y: 0.5)
        layer.endPoint = CGPoint(x: 1.0, y: 0.5)
        layer.colors = [theme.primaryColor.cgColor, theme.secondaryColor.cgColor]
    }
}
