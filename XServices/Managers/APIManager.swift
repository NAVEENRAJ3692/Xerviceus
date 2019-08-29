//
//  APIManager.swift
//  XServices
//
//  Created by K Saravana Kumar on 27/08/19.
//  Copyright © 2019 Securenext. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

typealias TypedAPICompletionHandler<T> = (_ result: T?, _ error: Error?) -> Void
typealias APICompletionHandler = (_ result: Any?, _ error: Error?) -> Void
typealias APIBooleanCompletionHandler = (_ success:Bool) -> Void


class APIManager {
    static let shared = APIManager()
    fileprivate let apiUri = "\(XerviceusConstants.apiHostUri)"
    private init(){
        print("** API Manager initiated with base URI: \(apiUri)")
    }
    fileprivate var headers: HTTPHeaders = [
//        "userType": "1",
        "Content-type": "application/json"
    ]
    var multiformHeader: HTTPHeaders?
    
    func updateJwtAuthToken(jwtAuthToken:String, type:String){
        headers = [
            "token": jwtAuthToken,
            "userType": type,
            //wrong content type
            //            "Content-type": "application/x-www-form-urlencoded;charset=UTF-8"
            //right content type
            "Content-type": "application/json"
            
        ]
        multiformHeader = ["token": jwtAuthToken,
                           "Content-type": "multipart/form-data",
                           "userType": type
        ]
        
    }
    
    func signInwithMobileNo(request:[String:Any], completion:APICompletionHandler?){
        print("API url = \(apiUri)/")
        Alamofire.request("\(apiUri)/", method: .post, parameters: request, encoding: JSONEncoding.default, headers: headers).response { (response) in
            let returnData = String(data: response.data!, encoding: .utf8)
            print("isUserExistResponse=",returnData! as Any)
            
            if response.response?.statusCode == 200 {
                
                do {
                    let json = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as! [String:Any]
                    print(json)
                    completion?(json, nil)
                    
                } catch let error as NSError {
                    print(error)
                }
                
            } else {
                completion?(nil, response.error)
            }
            
        }
    }
    
    func signInwithEmail(request:[String:Any], completion:TypedAPICompletionHandler<LoginResponse>?){
        print("API url = \(apiUri)/user/login")
        Alamofire.request("\(apiUri)/user/login", method: .post, parameters: request, encoding: JSONEncoding.default, headers: headers).response { (response) in
            let returnData = String(data: response.data!, encoding: .utf8)
            print("loginResponse=",returnData!)
            print("loginResponseStatusCode=",response.response?.statusCode as Any)

            if response.response?.statusCode == 200 {
                
                do {
                    let json = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as! [String:Any]
                    print(json)
                    let res = json["response"] as! [String:Any]
                    let data = res["data"] as! [String:Any]
                    let LoginValue = Mapper<LoginResponse>().map(JSON: data)
                    completion?(LoginValue, nil)
                    
                } catch let error as NSError {
                    print(error)
                }
                
            } else if response.response?.statusCode == 500 {
                let errorTemp = NSError(domain:"Invalid credentials", code:response.response!.statusCode, userInfo:nil)
                completion?(nil, errorTemp)
            }else{
                completion?(nil, response.error)
            }
            
        }
    }

}
