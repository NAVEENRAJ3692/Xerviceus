//
//  LandingVC.swift
//  XServices
//
//  Created by K Saravana Kumar on 26/08/19.
//  Copyright © 2019 Securenext. All rights reserved.
//

import UIKit

class LandingVC: UIViewController {
    
    let termsDiscover = "Terms"
    let conditionsDiscover = "Conditions"
    let wordTypeDiscover = "WordType"
    let normalDiscover = "Normal"
    
    
    @IBOutlet weak var termsTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated);
        super.viewWillDisappear(animated)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

}
