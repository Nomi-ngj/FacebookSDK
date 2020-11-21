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
    }
    
}

