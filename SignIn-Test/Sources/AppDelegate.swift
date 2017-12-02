//
//  AppDelegate.swift
//  SignIn-Test
//
//  Created by Mike on 12/2/17.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions
        launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let shared = GIDSignIn.sharedInstance()
        shared?.clientID = "49433690106-sgkjets1ajf2e5l7ige7iegh6otpg7t2.apps.googleusercontent.com"
        shared?.serverClientID = "49433690106-mqhg68pjt6jt3e6go2d44fs0au6s2902.apps.googleusercontent.com"
        
        return true
    }


}

