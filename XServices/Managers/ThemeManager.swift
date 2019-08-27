//
//  ThemeManager.swift
//  XServices
//
//  Created by K Saravana Kumar on 26/08/19.
//  Copyright © 2019 Securenext. All rights reserved.
//

import UIKit

class ThemeManager {
    static let sharedInstance = ThemeManager()
    
    fileprivate let gradientButtonColors = ["#4F86A6","#51B683", "#51B683"]
    fileprivate let gradientButtonColorsDisabled = ["#8C97A0","#B4C1BC", "#B4C1BC"]


    
    var gradientButtonTheme:Theme {
        return themeFrom(gradientButtonColors)
    }
    
    var gradientButtonDisabledTheme:Theme{
        return themeFrom(gradientButtonColorsDisabled)
    }

    
    fileprivate func themeFrom(_ colors: [String]) -> Theme {
        let theme = Theme()
        theme.primaryColor = UIColor(named: colors[0])
        theme.secondaryColor = UIColor(named: colors[1])
        theme.imageOverlayColor = UIColor(named: colors[2])
        return theme
    }
}
