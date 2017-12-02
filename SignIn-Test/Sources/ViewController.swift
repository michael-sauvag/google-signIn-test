//
//  ViewController.swift
//  SignIn-Test
//
//  Created by Mike on 12/2/17.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController,
    GIDSignInDelegate,
    GIDSignInUIDelegate
{
    @IBOutlet weak var googleSignIn: UIButton!
    @IBOutlet weak var serverCodeSignIn: UILabel!
    @IBOutlet weak var serverCodeSignInSilent: UILabel!
    @IBOutlet weak var errorDescription: UILabel!
    
    private var signInButtonTapped: UIButton?
    
    // MARK: Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSignInInstance()
    }
    
    // MARK: Google SignIn Delegates
    
    func sign(
        _ signIn: GIDSignIn!,
        didSignInFor user: GIDGoogleUser!,
        withError error: Error!) {
        
        handleAuth(user)
    }
    
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
        handleAuth(signIn.currentUser)
    }

    // MARK: Button Actions
    
    @IBAction func onSignIn(_ sender: UIButton) {
        signInButtonTapped = sender
        
        let shared = GIDSignIn.sharedInstance()
        
        googleSignIn == sender
            ? shared?.signIn()
            : shared?.signInSilently()
    }
    
    @IBAction func onSignOut() {
        GIDSignIn.sharedInstance().signOut()
    }
    
    // MARK: Private Methods
    
    private func handleAuth(_ user: GIDGoogleUser?) {
        guard let strongUser = user else {
            errorDescription.text = "No User Found"
            return
        }
        
        errorDescription.text = ""
        
        let serverCodeLabel = googleSignIn == signInButtonTapped
            ? serverCodeSignIn
            : serverCodeSignInSilent
        serverCodeLabel?.text = strongUser.serverAuthCode ?? "No Server Code"
    }
    
    private func setupSignInInstance() {
        let shared = GIDSignIn.sharedInstance()
        shared?.delegate = self
        shared?.uiDelegate = self
        
        shared?.scopes = [
            "https://www.googleapis.com/auth/plus.login",
            "https://www.googleapis.com/auth/plus.me",
            "https://www.googleapis.com/auth/userinfo.email",
            "https://www.googleapis.com/auth/userinfo.profile"
        ]
    }
    
}

