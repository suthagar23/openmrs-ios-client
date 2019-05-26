//
//  AddServerURLController.swift
//  OpenMRS-iOS-Client
//
//  Created by Kailayapathy Suthagar on 5/25/19.
//  Copyright © 2019 OpenMRS. All rights reserved.
//

import Foundation
import UIKit

class AddServerURLController: UIViewController {
    
    @IBOutlet weak var serverUrlText: UITextField!
    @IBOutlet weak var nextButton: LoadingButton!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        errorMessageLabel.isHidden = true
//        nextButton.isEnabled = false
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        nextButton.showLoading()
        let URL = serverUrlText.text
        if Utility.isValidURL(url: URL!) {
            do {
                _ = try Shared.sharedKeychainWrapper.setString(URL!, key: AppConfigs.KeychainKeys.OpenMRSServerURL)
                Shared.openmrsServerURL = URL!
                LoginViewController.showView()
            } catch _ {
                errorMessageLabel.text = "Could not save the serverURL. Please contact App Support"
                errorMessageLabel.isHidden = false
                nextButton.hideLoading()
            }
        } else {
            serverUrlText.selectAll("")
            errorMessageLabel.text = "Invalid server URL, Please check."
            errorMessageLabel.isHidden = false
            nextButton.hideLoading()
        }
    }
}

extension AddServerURLController {
    
    static func showView() {
        let storyboard: UIStoryboard = UIStoryboard(name: "Authentication", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "AddOpenMRSServerURLView")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        UIView.transition(with: appDelegate.window!, duration: 0.3, options: .transitionCrossDissolve, animations: {
            appDelegate.window?.rootViewController = viewController
        }, completion: { _ in
            // maybe do something here
        })
    }
}
