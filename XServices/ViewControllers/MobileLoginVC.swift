//
//  MobileLoginVC.swift
//  XServices
//
//  Created by K Saravana Kumar on 27/08/19.
//  Copyright © 2019 Securenext. All rights reserved.
//

import UIKit

class MobileLoginVC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var countryCode_Txt: UITextField!
    @IBOutlet weak var mobileNo_Txt: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var proceed_Btn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
        self.addDoneButtonOnKeyboard()
        self.setupNavigation()
        
        countryCode_Txt.layer.borderWidth = 2
        countryCode_Txt.layer.borderColor = UIColor(red: 117/255, green: 1/255, blue: 188/255, alpha: 1).cgColor
        

    }
    
    @objc func keyboardWillShow(notification:NSNotification){
        var userInfo = notification.userInfo!
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
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(MobileLoginVC.doneAction))
        
        let items = NSMutableArray()
        items.add(flexSpace)
        items.add(done)
        doneToolbar.items = items as? [UIBarButtonItem]
        doneToolbar.sizeToFit()
        
        self.mobileNo_Txt.inputAccessoryView = doneToolbar
        
    }
    @objc func doneAction()
    {
        let scrollPoint = CGPoint(x: 0, y: 0)
        scrollView.setContentOffset(scrollPoint, animated: true)
        self.mobileNo_Txt.resignFirstResponder()
        
    }
    
    @IBAction func proceed_Action(_ sender: Any) {
        
        if mobileNo_Txt.text!.isEmpty {
            self.showStandardAlertDialog(title: "Alert!", msg: "Please enter the mobile number")
        }else{
//            mobileNoAPICall()
            self.performSegue(withIdentifier: "segueMobileNoLoginToOTP", sender: nil)

        }
    }
    

    
    func mobileNoAPICall() {
        self.showProgressIndicator()
        let req = ["mobileno":mobileNo_Txt.text!]
        APIManager.shared.signInwithMobileNo(request: req) { (response, error) in
            if error == nil{
                self.performSegue(withIdentifier: "segueMobileNoLoginToOTP", sender: nil)
            }else{
                self.showStandardAlertDialog(title: "error!", msg: error!.localizedDescription)
            }
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
        
        navigationItem.title = "Mobile Login"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav_back_arrow"), style: UIBarButtonItem.Style.done, target: self, action: #selector(rewindview))
        navigationItem.leftBarButtonItem?.image = navigationItem.leftBarButtonItem?.image!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
    
    }
    
    @objc func rewindview() {
        self.performDismiss()
    }

}
