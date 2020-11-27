//
//  ViewController.swift
//  Social_LoginSdk
//
//  Created by Nouman Gul on 21/11/2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func facebookLogin(_ sender:UIButton){
        FacebookManager.delegate = self
        FacebookManager.shared.login { [weak self] (facebookUser, error) in
            if let error = error{
                debugPrint(error)
            }else{
                if let facebookUser = facebookUser{
                    debugPrint(facebookUser)
                }
            }
        }
    }
    
}

