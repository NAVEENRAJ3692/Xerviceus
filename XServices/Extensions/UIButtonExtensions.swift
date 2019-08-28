//
//  UIButtonExtensions.swift
//  XServices
//
//  Created by K Saravana Kumar on 27/08/19.
//  Copyright © 2019 Securenext. All rights reserved.
//

import UIKit

extension UIButton {

    func setCornerRadius(button:UIButton,cornerRadius:CGFloat) {
        button.layer.cornerRadius = cornerRadius
        button.clipsToBounds = true
    }
    
}
