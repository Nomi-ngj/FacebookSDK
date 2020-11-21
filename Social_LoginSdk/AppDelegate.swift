//
//  AppDelegate.swift
//  Social_LoginSdk
//
//  Created by Nouman Gul on 21/11/2020.
//

import UIKit
import FacebookLogin
import FBSDKCoreKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    static let shared = AppDelegate()
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)

        return true
    }

    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool
    {
        return ApplicationDelegate.shared.application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
    }
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let appId: String = "1293738161010395"
        if url.scheme != nil && url.scheme!.hasPrefix("fb\(appId)") && url.host ==  "authorize" {
            return AppDelegate.shared.application(app, open: url, options: options)
        }
        return false
    }
}

