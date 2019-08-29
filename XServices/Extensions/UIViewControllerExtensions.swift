//
//  UIViewControllerExtensions.swift
//  XServices
//
//  Created by K Saravana Kumar on 26/08/19.
//  Copyright © 2019 Securenext. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func proceedToApplication(){
        let vc = UIStoryboard.instantiateLoginViewController(LandingVC.self)
        self.view.window?.fadeSwitchRootViewController(vc)
    }
    
    class func getIdentifier() -> String {
        let className = NSStringFromClass(self).components(separatedBy: ".").last!
        return className.lowercaseFirst
    }
    
    func showStandardAlertDialog(title:String = "Error", msg:String = "An unhandled error occurred."){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK 😩", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    func performDismiss()  {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func showProgressIndicator() {
        view.addSubview(ProgressIndicatorManager.shared.progressIndicator)
        ProgressIndicatorManager.shared.progressIndicator.center = view.center
        ProgressIndicatorManager.shared.startAnimating()
        
        toggleUserInteraction(false)
    }
    
    
    func hideProgressIndicator() {
        
        ProgressIndicatorManager.shared.progressIndicator.removeFromSuperview()
        ProgressIndicatorManager.shared.stopAnimating()
        
        toggleUserInteraction(true)
    }
    
    func toggleUserInteraction(_ enable: Bool) {
        if let activeView = navigationController?.view ?? view {
            activeView.isUserInteractionEnabled = enable
        }
    }
}
