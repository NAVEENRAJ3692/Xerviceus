//
//  MobileLoginVC.swift
//  XServices
//
//  Created by K Saravana Kumar on 27/08/19.
//  Copyright © 2019 Securenext. All rights reserved.
//

import UIKit

class MobileLoginVC: UIViewController {

    @IBOutlet weak var countryCode_Txt: UITextField!
    @IBOutlet weak var mobileNo_Txt: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var proceed_Btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func proceed_Action(_ sender: Any) {
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
