//
//  OtpVC.swift
//  XServices
//
//  Created by K Saravana Kumar on 27/08/19.
//  Copyright © 2019 Securenext. All rights reserved.
//

import UIKit

class OtpVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var sec_Txt: UILabel!
    @IBOutlet weak var otp_Txt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func resend_Action(_ sender: Any) {
    }
    
    @IBAction func signIn_Action(_ sender: Any) {
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
