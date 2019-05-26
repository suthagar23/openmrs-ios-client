//
//  LoginViewController.swift
//  OpenMRS-iOS-Client
//
//  Created by Kailayapathy Suthagar on 5/26/19.
//  Copyright © 2019 OpenMRS. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextbox: UITextField!
    @IBOutlet weak var passwordTextbox: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var LoginButton: LoadingButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        errorLabel.isHidden = true
    }
    
    @IBAction func changeServerURLOnClick(_ sender: Any) {
        AddServerURLController.showView()
    }
    
    @IBAction func loginOnClick(_ sender: Any) {
        LoginButton.showLoading()
        if usernameTextbox.text == "" || passwordTextbox.text == "" {
            errorLabel.text = "Username or Password can not be empty"
            errorLabel.isHidden = false
            LoginButton.hideLoading()
        } else {
            usernameTextbox.isEnabled = false
            passwordTextbox.isEnabled = false
            
            Shared.sharedNetworWrapper.authenticateUser(userName: usernameTextbox.text, password: passwordTextbox.text, onSuccess: { [weak self] authResponse in
                if authResponse.authenticated! {
                    print("Success")
                } else {
                    self?.errorLabel.text = ApiResponseErrors.authError(errorCode: ApiErrorCodes.authenticationError).description
                    self?.errorLabel.isHidden = false
                    self?.LoginButton.hideLoading()
                }
            }, onError: { [weak self] error in
                self?.errorLabel.text = error.description
                self?.errorLabel.isHidden = false
                self?.LoginButton.hideLoading()
            })
            
            usernameTextbox.isEnabled = true
            passwordTextbox.isEnabled = true
        }
    }
}

extension LoginViewController {
    
    static func showView() {
        let storyboard: UIStoryboard = UIStoryboard(name: "Authentication", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "LoginView")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        UIView.transition(with: appDelegate.window!, duration: 0.3, options: .transitionCrossDissolve, animations: {
            appDelegate.window?.rootViewController = viewController
        }, completion: { _ in
            // maybe do something here
        })
    }
}
