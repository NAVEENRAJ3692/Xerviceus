//
//  SplashLandingViewController.swift
//  XServices
//
//  Created by K Saravana Kumar on 28/08/19.
//  Copyright © 2019 Securenext. All rights reserved.
//

import UIKit

class SplashLandingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if CurrentUserManager.shared.userSignInComplete {

//           let desiredViewController = UIStoryboard.instantiateTabbarViewController(LandingVC.self)
//            self.view.window?.fadeSwitchRootViewController(desiredViewController)
            self.performSegue(withIdentifier: "tabbar", sender: nil)

        } else {
//            let desiredViewController = UIStoryboard.instantiateLoginViewController(LandingVC.self)
//            self.view.window?.fadeSwitchRootViewController(desiredViewController)
            self.performSegue(withIdentifier: "login", sender: nil)

        }

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
