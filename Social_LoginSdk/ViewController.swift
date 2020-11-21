//
//  ViewController.swift
//  Social_LoginSdk
//
//  Created by Nouman Gul on 21/11/2020.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

//        view.addSubview(loginButton)
        // Do any additional setup after loading the view.
    }

    @IBAction func facebookLogin(_ sender:UIButton){
//        let facebookLoginManger : Facebo = FacebookLogin()
//        facebookLoginManger.log
        let fbManager : LoginManager = LoginManager()
        fbManager.logIn(permissions: ["public_profile","email"], from: self) { (result, error) in
            if error != nil {
                print(error!.localizedDescription)
                self.dismiss(animated: true, completion: nil)
            } else if result!.isCancelled {
                print("Cancelled")
                self.dismiss(animated: true, completion: nil)
            }else{

                GraphRequest.init(graphPath: "me", parameters: ["fields": "id, name ,email, first_name,last_name"]).start { (connection, result, error) in
                    let fbDetails = result as! NSDictionary
                    print(fbDetails)
                }
            }
        }
//        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
//          fbLoginManager.loginBehavior = FBSDKLoginBehavior.web
//          fbLoginManager.logIn(withReadPermissions: ["public_profile","email"], from: self) { (result, error) -> Void in
//              if error != nil {
//                  print(error!.localizedDescription)
//                  self.dismiss(animated: true, completion: nil)
//              } else if result!.isCancelled {
//                  print("Cancelled")
//                  self.dismiss(animated: true, completion: nil)
//              } else {
//                  FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, relationship_status"]).start(completionHandler: { (connection, result, error) -> Void in
//                      if (error == nil){
//                          let fbDetails = result as! NSDictionary
//                          print(fbDetails)
//                      }
//                  })
//              }
//          }
    }
    
}

