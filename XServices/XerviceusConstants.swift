//
//  XerviceusConstants.swift
//  XServices
//
//  Created by K Saravana Kumar on 27/08/19.
//  Copyright © 2019 Securenext. All rights reserved.
//

import Foundation

struct XerviceusConstants {

    //MARK API configuration constants
    enum ApiEnvironment:String {
        
        case Release = "http://3.83.243.193:3000"
        
        case Debug = "https:"
        
        case AppStore = "https::"
        
    }
    
    #if DEBUGaws
    
    static let apiHostUri = ApiEnvironment.Debug.rawValue
    //static let apiHostUri = ApiEnvironment.Release.rawValue
    
    #else
    
    // static let apiHostUri = ApiEnvironment.Release.rawValue
    static let apiHostUri = ApiEnvironment.Debug.rawValue
    
    #endif
    
    static let kJwtAccessTokenKeyChain = "com.Xerviceus.v1.jwtAccessToken"
    static let kUserTypeKeyChain = "com.Xerviceus.v1.UserTypeKey"
    static let kSignInComplete = "com.Xerviceus.v1.SignInComplete"

    

    
    //Device identify
//    static let IS_IPAD = (UI_USER_INTERFACE_IDIOM() == .pad)
//    static let IS_IPHONE = (UI_USER_INTERFACE_IDIOM() == .phone)
//    static let IS_RETINA = (UIScreen.main.scale >= 2.0)
//    static let SCREEN_WIDTH = (UIScreen.main.bounds.size.width)
//    static let SCREEN_HEIGHT = (UIScreen.main.bounds.size.height)
//    static let SCREEN_MAX_LENGTH = (max(SCREEN_WIDTH, SCREEN_HEIGHT))
//    static let SCREEN_MIN_LENGTH = (min(SCREEN_WIDTH, SCREEN_HEIGHT))
//    static let IS_IPHONE_4_OR_LESS = (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
//    static let IS_IPHONE_5 = (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
//    static let IS_IPHONE_6 = (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
//    static let IS_IPHONE_6P = (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)
//    static let IS_IPHONE_X = (IS_IPHONE && SCREEN_MAX_LENGTH == 812.0)
}
