//
//  UIWindowExtensions.swift
//  XServices
//
//  Created by K Saravana Kumar on 28/08/19.
//  Copyright © 2019 Securenext. All rights reserved.
//

import UIKit

extension UIWindow {
    func fadeSwitchRootViewController(_ newRootViewController: UIViewController) {
        
        if let snapshot:UIView = (self.snapshotView(afterScreenUpdates: true)) {
            newRootViewController.view.addSubview(snapshot);
            
            rootViewController = newRootViewController
            makeKeyAndVisible()
            
            UIView.animate(withDuration: 1.2, animations: {() in
                snapshot.layer.opacity = 0;
                //snapshot.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5);
            }, completion: {
                (value: Bool) in
                snapshot.removeFromSuperview();
            });
        }
        
    }
}
