//
//  LoginViewController.swift
//  OAuthExample
//
//  Created by Andrei Momot on 11/16/17.
//  Copyright © 2017 Andrey Momot. All rights reserved.
//

import UIKit

typealias LoginViewControllerType = MVCViewController<LoginModelProtocol, LoginViewProtocol, LoginRouter>

class LoginViewController: LoginViewControllerType {
    
    // MARK: Initializers
    
    required public init(withView view: LoginViewProtocol!, model: LoginModelProtocol!, router: LoginRouter?) {
        super.init(withView: view, model: model, router: router)
    }
    
    // MARK: - View life cycle

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        customView.delegate = self
        model.delegate = self
    }
}

// MARK: - LoginViewDelegate

extension LoginViewController: LoginViewDelegate {
    func viewLoginFacebook(view: LoginViewProtocol) {
        
    }
    
    func viewLoginTwitter(view: LoginViewProtocol) {
        
    }
    
    func viewLoginGoogle(view: LoginViewProtocol) {
    
    }
    
    func viewLoginWeChat(view: LoginViewProtocol) {
        
    }
    
    func viewLoginWeibo(view: LoginViewProtocol) {
        
    }
    
    func viewLoginQQ(view: LoginViewProtocol) {
        
    }
}

// MARK: - LoginModelDelegate

extension LoginViewController: LoginModelDelegate {
}
