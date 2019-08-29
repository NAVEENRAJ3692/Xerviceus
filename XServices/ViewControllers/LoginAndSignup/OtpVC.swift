//
//  OtpVC.swift
//  XServices
//
//  Created by K Saravana Kumar on 27/08/19.
//  Copyright © 2019 Securenext. All rights reserved.
//

import UIKit

class OtpVC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var sec_Txt: UILabel!
    @IBOutlet weak var otp_Txt: UITextField!
    
    var seconds = 30 //This variable will hold a starting value of seconds. It could be any amount above 0.
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
        addDoneButtonOnKeyboard()
        self.runTimer()
        otp_Txt.layer.borderWidth = 2
        otp_Txt.layer.borderColor = UIColor(red: 117/255, green: 1/255, blue: 188/255, alpha: 1).cgColor

        setupNavigation()
    }
    @objc func keyboardWillShow(notification:NSNotification){
        let userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        scrollView.contentInset = contentInset
    }
    
    @objc func keyboardWillHide(notification:NSNotification){
        
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle = UIBarStyle.default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(OtpVC.doneAction))
        
        let items = NSMutableArray()
        items.add(flexSpace)
        items.add(done)
        doneToolbar.items = items as? [UIBarButtonItem]
        doneToolbar.sizeToFit()
        
        self.otp_Txt.inputAccessoryView = doneToolbar
        
    }
    @objc func doneAction()
    {
//        let scrollPoint = CGPoint(x: 0, y: 0)
//        scrollView.setContentOffset(scrollPoint, animated: true)
        self.otp_Txt.resignFirstResponder()
        
    }
    
    @IBAction func resend_Action(_ sender: Any) {
        self.runTimer()
    }
    
    @IBAction func signIn_Action(_ sender: Any) {
        
        if otp_Txt.text!.isEmpty{
            self.showStandardAlertDialog(title: "Alert", msg: "Please enter the OTP")
        }else{
            self.performSegue(withIdentifier: "segueMobileNoLoginToTabbar", sender: nil)
        }
        
    }
    func runTimer() {
        seconds = 30
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(OtpVC.updateTimer)), userInfo: nil, repeats: true)
    }
    @objc func updateTimer() {
        if seconds == 0 {
            timer.invalidate()
        }else{
            seconds -= 1     //This will decrement(count down)the seconds.
            sec_Txt.text = "00:\(String(seconds))" //This will update the label.
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
    
    fileprivate func setupNavigation() {
        
        //        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        //        self.navigationController?.navigationBar.shadowImage = UIImage()
        //        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor(red: 117/255, green: 1/255, blue: 188/255, alpha: 1)
        
        navigationItem.title = "OTP"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav_back_arrow"), style: UIBarButtonItem.Style.done, target: self, action: #selector(rewindview))
        navigationItem.leftBarButtonItem?.tintColor = .white
        navigationItem.leftBarButtonItem?.image = navigationItem.leftBarButtonItem?.image!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
    }
    
    @objc func rewindview() {
        self.performDismiss()
    }

}
