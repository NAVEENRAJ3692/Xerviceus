//
//  EmailLoginVC.swift
//  XServices
//
//  Created by K Saravana Kumar on 27/08/19.
//  Copyright © 2019 Securenext. All rights reserved.
//

import UIKit

class EmailLoginVC: UIViewController,UITextFieldDelegate {
    
    let termsDiscover = "Terms"
    let conditionsDiscover = "Conditions"
    let wordTypeDiscover = "WordType"
    let normalDiscover = "Normal"

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var password_Txt: UITextField!
    @IBOutlet weak var emailID_Txt: UITextField!
    @IBOutlet weak var passhide_Btn: UIButton!
    
    @IBOutlet weak var termsTextView: UITextView!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
        self.setupNavigation()
        
        passhide_Btn.setImage(UIImage(named: "Unchecked"), for: .normal)
        passhide_Btn.setImage(UIImage(named: "Checked"), for: .selected)
        termsTextView.attributedText = self.attributedMessage(message: "By Signing up, you agree to out. Terms and Conditions")

    }
    
    func attributedMessage(message: String) -> NSMutableAttributedString {
        
        // let messageArray = message.components(separatedBy: " ")
        let messageArray = message.components(separatedBy: " ")
        let attributeString = NSMutableAttributedString()
        var dic = [NSAttributedString.Key: Any]()
        for word in messageArray {
            if word.contains("Terms"){
                
                dic = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue):UIColor.blue,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 12), NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue as AnyObject, NSAttributedString.Key(rawValue: wordTypeDiscover): termsDiscover as AnyObject, NSAttributedString.Key(rawValue: termsDiscover):word as AnyObject]
            }
                
            else if word.contains("Conditions") {
                dic = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue):UIColor.blue,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 12), NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue as AnyObject, NSAttributedString.Key(rawValue: wordTypeDiscover): conditionsDiscover as AnyObject, NSAttributedString.Key(rawValue: conditionsDiscover):word as AnyObject]
            }
                
            else {
                dic = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue):UIColor.black,NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12), NSAttributedString.Key(rawValue: wordTypeDiscover): normalDiscover as AnyObject, NSAttributedString.Key(rawValue: normalDiscover):word as AnyObject]
            }
            
            let subString = NSAttributedString(string: "\(word) ", attributes: dic)
            attributeString.append(subString)
        }
        
        return attributeString
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
    
    @IBAction func signIn_Action(_ sender: Any) {
        
        if emailID_Txt.text!.isEmpty {
            self.showStandardAlertDialog(title: "Alert!", msg: "Please enter the email ID")
        }else if !CurrentUserManager.shared.isValidEmail(email: emailID_Txt.text!){
            self.showStandardAlertDialog(title: "Alert!", msg: "Please enter the valid email ID")
        }else if password_Txt.text!.isEmpty {
            self.showStandardAlertDialog(title: "Alert!", msg: "Please enter the password")
        }else{
//            logInAPICall()
            self.performSegue(withIdentifier: "segueEmailLoginToTabbar", sender: nil)

        }
    }
    
    func logInAPICall()  {
        self.showProgressIndicator()
    let req = ["request":["email":emailID_Txt.text!,"password":password_Txt.text!]]
        APIManager.shared.signInwithEmail(request: req) { (response, error) in
            self.hideProgressIndicator()
            
            if error == nil{
                self.performSegue(withIdentifier: "segueEmailLoginToTabbar", sender: nil)
            }else{
                self.showStandardAlertDialog(title: "error", msg: error!.localizedDescription)
            }
            
            
        }
    }
    
    @IBAction func passwordShow_Action(_ sender: Any) {
        
        if let button = sender as? UIButton {
            if button.isSelected {
                // set deselected
                button.isSelected = false
            } else {
                // set selected
                button.isSelected = true
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
        
        navigationItem.title = "Email Login"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav_back_arrow"), style: UIBarButtonItem.Style.done, target: self, action: #selector(rewindview))
        navigationItem.leftBarButtonItem?.image = navigationItem.leftBarButtonItem?.image!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
    }
    
    @objc func rewindview() {
        self.performDismiss()
    }

}
