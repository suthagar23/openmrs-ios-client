//
//  SplashScreen.swift
//  OpenMRS-iOS-Client
//
//  Created by Kailayapathy Suthagar on 5/18/19.
//  Copyright © 2019 OpenMRS. All rights reserved.
//

import Foundation
import UIKit

class LaunchScreenController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if checkOpenMRSServerURL() {
            LoginViewController.showView()
        } else {
            AddServerURLController.showView()
        }
    }

    func checkOpenMRSServerURL() -> Bool {
        guard Shared.openmrsServerURL != "" else {
            return false
        }
        return true
    }
}

extension LaunchScreenController {
    
    static func showView() {
        let storyboard: UIStoryboard = UIStoryboard(name: "Authentication", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "LaunchScreenView")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        UIView.transition(with: appDelegate.window!, duration: 0.3, options: .transitionCrossDissolve, animations: {
            appDelegate.window?.rootViewController = viewController
        }, completion: { _ in
            // maybe do something here
        })
    }
}
