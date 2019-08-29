//
//  LoginResponse.swift
//  XServices
//
//  Created by K Saravana Kumar on 28/08/19.
//  Copyright © 2019 Securenext. All rights reserved.
//

import UIKit
import ObjectMapper

class LoginResponse: Mappable {
    

    
    var token:String?
    var userType:Int?
    

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        token     <- map["token"]
        userType  <- map["userType"]
        
    }
    

}
