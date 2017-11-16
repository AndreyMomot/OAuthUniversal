//
//  LoginView.swift
//  OAuthExample
//
//  Created by Andrei Momot on 11/16/17.
//  Copyright © 2017 Andrey Momot. All rights reserved.
//

import UIKit

protocol LoginViewDelegate: NSObjectProtocol {
    
    func viewLoginFacebook(view: LoginViewProtocol)
    func viewLoginTwitter(view: LoginViewProtocol)
    func viewLoginGoogle(view: LoginViewProtocol)
    func viewLoginWeChat(view: LoginViewProtocol)
    func viewLoginWeibo(view: LoginViewProtocol)
    func viewLoginQQ(view: LoginViewProtocol)

}

protocol LoginViewProtocol: NSObjectProtocol {
    
    weak var delegate: LoginViewDelegate? { get set }
}

class LoginView: UIView, LoginViewProtocol{
    
    // MARK: - LoginView interface methods

    weak public var delegate: LoginViewDelegate?
    
    // MARK: - Overrided methods

    override public func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - IBActions
    @IBAction func onPressedLoginFacebook(_ sender: Any) {
        self.delegate?.viewLoginFacebook(view: self)
    }
    
    @IBAction func onPressedLoginTwitter(_ sender: Any) {
        self.delegate?.viewLoginTwitter(view: self)
    }
    
    @IBAction func onPressedLoginGoogle(_ sender: Any) {
        self.delegate?.viewLoginGoogle(view: self)
    }
    
    @IBAction func onPressedLoginWeChat(_ sender: Any) {
        self.delegate?.viewLoginWeChat(view: self)
    }
    
    @IBAction func onPressedLoginWeibo(_ sender: Any) {
        self.delegate?.viewLoginWeibo(view: self)
    }
    
    @IBAction func onPressedLoginQQ(_ sender: Any) {
        self.delegate?.viewLoginQQ(view: self)
    }
}
