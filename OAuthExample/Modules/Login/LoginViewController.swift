//
//  LoginViewController.swift
//  OAuthExample
//
//  Created by Andrei Momot on 11/16/17.
//  Copyright © 2017 Andrey Momot. All rights reserved.
//

import UIKit
import TwitterKit
import GoogleSignIn
import FBSDKLoginKit

typealias LoginViewControllerType = MVCViewController<LoginModelProtocol, LoginViewProtocol, LoginRouter>

class LoginViewController: LoginViewControllerType, GIDSignInDelegate, GIDSignInUIDelegate {
    
    // MARK: Initializers
    
    required public init(withView view: LoginViewProtocol!, model: LoginModelProtocol!, router: LoginRouter?) {
        super.init(withView: view, model: model, router: router)
    }
    
    // MARK: - View life cycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        customView.delegate = self
        model.delegate = self
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    // MARK: - GoogleDelegate methods
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error != nil) {
            print(error.localizedDescription)
        } else {
            let authentication = user.authentication
            print("Access token:, \(String(describing: authentication?.accessToken!))")
        }
    }
    
    private func signIn(signIn: GIDSignIn!, didDisconnectWithUser user:GIDGoogleUser!,
                        withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
    }
}

// MARK: - LoginViewDelegate

extension LoginViewController: LoginViewDelegate {
    
    func viewLoginFacebook(view: LoginViewProtocol) {
        let loginManager = FBSDKLoginManager.init()
        loginManager.logIn(withReadPermissions: [AppApiServices.facebookPermission], from: self) { (result, error) in
            
            if (error != nil) {
                print("Error: \(String(describing: error?.localizedDescription))")
            } else {
                // Need to check if user cancelled the login process
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                if result!.isCancelled {
                    return
                }
                if(fbloginresult.grantedPermissions.contains(AppApiServices.facebookPermission))
                {
                    print("Token: \(String(describing: result?.token.tokenString))")
                }
            }
        }
    }
    
    func viewLoginTwitter(view: LoginViewProtocol) {
        Twitter.sharedInstance().logIn { (session, error) in
            if (session != nil) {
                print("Token: \(String(describing: session?.authToken))")
            } else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    func viewLoginGoogle(view: LoginViewProtocol) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    func viewLoginWeChat(view: LoginViewProtocol) {
        // Need AS/EU/SA mobile phone to complete registration
        // Have to register a developer account -> Company License, Declaration of Authorization
    }
    
    func viewLoginWeibo(view: LoginViewProtocol) {
        // Need AS/EU/SA mobile phone to complete registration
    }
    
    func viewLoginQQ(view: LoginViewProtocol) {
        // Have to register a developer account -> Company License, Declaration of Authorization
    }
}

// MARK: - LoginModelDelegate

extension LoginViewController: LoginModelDelegate {
}
