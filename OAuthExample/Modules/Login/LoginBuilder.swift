//
//  LoginBuilder.swift
//  OAuthExample
//
//  Created by Andrei Momot on 11/16/17.
//  Copyright © 2017 Andrey Momot. All rights reserved.
//

import UIKit

class LoginBuilder: NSObject {

    class func viewController() -> LoginViewController {

        let view: LoginViewProtocol = LoginView.create() as  LoginViewProtocol
        let model: LoginModelProtocol = LoginModel()
        let router = LoginRouter()
        
        let viewController = LoginViewController(withView: view, model: model, router: router)
        return viewController
    }
}
