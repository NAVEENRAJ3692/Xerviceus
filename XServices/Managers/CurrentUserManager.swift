//
//  CurrentUserManager.swift
//  XServices
//
//  Created by K Saravana Kumar on 27/08/19.
//  Copyright © 2019 Securenext. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper


class CurrentUserManager {

    static let shared = CurrentUserManager()
    
    var currentUser:User? = nil{
        didSet{
            
        }
    }

    
    var jwtAuthToken:String = "" {
        didSet{
            
            if !jwtAuthToken.isEmpty {
                KeychainWrapper.standard.set(jwtAuthToken, forKey: XerviceusConstants.kJwtAccessTokenKeyChain)
            } else {
                self.removeJwtAccessTokenIfPreviouslyStored()
            }
            
        }
    }
    var UserType:String = "" {
        didSet{
            
            if !UserType.isEmpty {
                KeychainWrapper.standard.set(UserType, forKey: XerviceusConstants.kUserTypeKeyChain)
            } else {
                self.removeUserTypeIfPreviouslyStored()
            }
            
        }
    }
    
    //This variable determines whether the user has completed onboarding or not
    var userSignInComplete:Bool = UserDefaultsHelper.hasValueForKey(XerviceusConstants.kSignInComplete) {
        willSet(newValue){
            
            if newValue == true {
                UserDefaultsHelper.setValueForKey(XerviceusConstants.kSignInComplete, value: true)
            } else {
                UserDefaultsHelper.removeValueForKey(XerviceusConstants.kSignInComplete)
            }
        }
        
    }
    
    private init(){
        
        guard let storedToken = KeychainWrapper.standard.string(forKey: XerviceusConstants.kJwtAccessTokenKeyChain) else {
            return
        }
        guard let storedUserType = KeychainWrapper.standard.string(forKey: XerviceusConstants.kUserTypeKeyChain) else {
            return
        }
        
        
        if userSignInComplete {
            jwtAuthToken = storedToken
            UserType = storedUserType
            APIManager.shared.updateJwtAuthToken(jwtAuthToken: jwtAuthToken, type: UserType)
        }
        
        
    }
    
    
    func deleteLocalProfilePicture(){
        do {
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileURL = documentsURL.appendingPathComponent("user_profile.jpg")
            
            try FileManager.default.removeItem(at: fileURL)
            
            
        } catch {
            
            
        }
    }
    
    func saveLocalProfilePicture(imgData:Data){
        do {
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileURL = documentsURL.appendingPathComponent("user_profile.jpg")
            
            try imgData.write(to: fileURL, options: .atomic)
            
        } catch { }
        
    }
    
    func saveLocalProfilePicture(img:UIImage){
        if let data = img.jpegData(compressionQuality: 0.85){
            
            do {
                let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                let fileURL = documentsURL.appendingPathComponent("user_profile.jpg")
                
                try data.write(to: fileURL, options: .atomic)
                
            } catch { }
            
        }
    }
    
    func getLocalProfilePicture()->UIImage?{
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let filePath = documentsURL.appendingPathComponent("user_profile.jpg").path
        if FileManager.default.fileExists(atPath: filePath) {
            return UIImage(contentsOfFile: filePath)
        }else{
            
        }
        return nil
    }
    

    func logout(){
        
        
        UIApplication.shared.applicationIconBadgeNumber = 0
        currentUser = nil
        jwtAuthToken = ""
        UserType = ""
        userSignInComplete = false
        
        deleteLocalProfilePicture()
    }
    
    func removeJwtAccessTokenIfPreviouslyStored(){
        KeychainWrapper.standard.removeObject(forKey: XerviceusConstants.kJwtAccessTokenKeyChain)
    }
    func removeUserTypeIfPreviouslyStored(){
        KeychainWrapper.standard.removeObject(forKey: XerviceusConstants.kUserTypeKeyChain)
    }
    

    func isValidEmail(email: String) -> Bool {
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        return emailTest.evaluate(with: email)
        
        
    }
    
    func getWiFiAddress() -> String? {
        var address : String?
        
        // Get list of all interfaces on the local machine:
        var ifaddr : UnsafeMutablePointer<ifaddrs>?
        guard getifaddrs(&ifaddr) == 0 else { return nil }
        guard let firstAddr = ifaddr else { return nil }
        
        // For each interface ...
        for ifptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
            let interface = ifptr.pointee
            
            // Check for IPv4 or IPv6 interface:
            let addrFamily = interface.ifa_addr.pointee.sa_family
            if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
                
                // Check interface name:
                let name = String(cString: interface.ifa_name)
                if  name == "en0" {
                    
                    // Convert interface address to a human readable string:
                    var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                    getnameinfo(interface.ifa_addr, socklen_t(interface.ifa_addr.pointee.sa_len),
                                &hostname, socklen_t(hostname.count),
                                nil, socklen_t(0), NI_NUMERICHOST)
                    address = String(cString: hostname)
                }
            }
        }
        freeifaddrs(ifaddr)
        
        return address
    }
}
