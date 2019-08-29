//
//  UIStoryBoardExtensions.swift
//  XServices
//
//  Created by K Saravana Kumar on 28/08/19.
//  Copyright © 2019 Securenext. All rights reserved.
//

import UIKit

extension UIStoryboard {
    class func mainStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
        
    }
    class func tabbarStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Tabbar", bundle: Bundle.main)
        
    }
    
    class func instantiateLoginViewController<T: UIViewController>(_ viewControllerClass: T.Type, storyboard: UIStoryboard = UIStoryboard.mainStoryboard()) -> T {
        return storyboard.instantiateInitialViewController() as! T
    }
    
    class func instantiateTabbarViewController<T: UIViewController>(_ viewControllerClass: T.Type, storyboard: UIStoryboard = UIStoryboard.tabbarStoryboard()) -> T {
        return storyboard.instantiateInitialViewController() as! T
    }

}
