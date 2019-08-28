//
//  UserDefaultsHelper.swift
//  XServices
//
//  Created by K Saravana Kumar on 27/08/19.
//  Copyright © 2019 Securenext. All rights reserved.
//

import UIKit

class UserDefaultsHelper {
    class func setValueForKey(_ key: String, value: Any) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    class func getStringValueForKey(_ key:String)->String? {
        return UserDefaults.standard.string(forKey: key)
    }
    
    class func getValueForKey(_ key: String) -> Any? {
        return UserDefaults.standard.object(forKey: key)
    }
    
    class func getUnsafeValueForKey(_ key: String) -> Any {
        return UserDefaults.standard.object(forKey: key)! as Any
    }
    
    class func hasValueForKey(_ key: String) -> Bool {
        return (UserDefaults.standard.object(forKey: key) != nil)
    }
    
    class func removeValueForKey(_ key: String) {
        if hasValueForKey(key) {
            UserDefaults.standard.removeObject(forKey: key)
        }
    }
}
