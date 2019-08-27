//
//  UIViewExtensions.swift
//  XServices
//
//  Created by K Saravana Kumar on 26/08/19.
//  Copyright © 2019 Securenext. All rights reserved.
//

import UIKit

extension UIView{
    
    
    func addUpperServicesShadow(to layer:CALayer){
        
        
        layer.cornerRadius = 0
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 0, height: -6)
        layer.shadowRadius = 9
        layer.shadowOpacity = 0.2
        layer.shadowColor = UIColor.topShadowColor.cgColor
        
        
    }
}
