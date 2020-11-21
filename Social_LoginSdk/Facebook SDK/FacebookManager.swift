//
//  FacebookManager.swift
//  Social_LoginSdk
//
//  Created by Nouman Gul on 21/11/2020.
//

import Foundation
import FBSDKLoginKit
import FBSDKCoreKit

class  FacebookManager{
    static let shared = FacebookManager()
    static var delegate:UIViewController!
    let fbManager : LoginManager = LoginManager()
    var user:FacebookResponse?
    
    func login(completion: @escaping (FacebookResponse?, String?) -> Void) {
        let fbManager : LoginManager = LoginManager()
        fbManager.logIn(permissions: ["public_profile","email"], from: FacebookManager.delegate) { (result, error) in
            if error != nil {
                
                completion(nil,error!.localizedDescription)
                FacebookManager.delegate.dismiss(animated: true, completion: nil)
            } else if result!.isCancelled {
                print("Cancelled")
                completion(nil,"Cancelled")
                FacebookManager.delegate.dismiss(animated: true, completion: nil)
            }else{
                
                GraphRequest.init(graphPath: "me", parameters: ["fields": "id, name ,email, first_name,last_name, gender"]).start { (connection, result, error) in
                    if let fbDetails = result as? NSDictionary{
                        do{
                            let documentData = try JSONSerialization.data(withJSONObject: fbDetails, options: [])
                            let documentObject = try JSONDecoder().decode(FacebookResponse.self, from: documentData)
                            self.user = documentObject
                            debugPrint(documentObject)
                            completion(documentObject,nil)
                        }catch{
                            completion(nil,error.localizedDescription)
                            
                        }
                    }else{
                        completion(nil,error?.localizedDescription ?? "Error")
                    }
                }
            }
        }
    }
}

enum CustomError: String, Error {
    case somethingBadHappened = "Error: Something went wrong"
}
