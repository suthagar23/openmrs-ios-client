//
//  SharedInstances.swift
//  OpenMRS-iOS-Client
//
//  Created by Kailayapathy Suthagar on 5/17/19.
//  Copyright © 2019 OpenMRS. All rights reserved.
//

import Foundation

class Shared {

    static var authorizedToken: String?

    static var openmrsServerURL: String = {
        do {
            return try sharedKeychainWrapper.getString(AppConfigs.KeychainKeys.OpenMRSServerURL) ?? ""
        } catch let error {
            return ""
        }
    }()
    
    /// Shared NetworkManager which can handles the BffRequests
    static var sharedNetworWrapper: NetworkWrapper = {
        var networkWrapper = NetworkWrapper()
        return networkWrapper
    }()
    
    /// Shared KeychainWrapper instance among all the classes
    static var sharedKeychainWrapper: KeychainStorageWrapper = {
        let keychainWrapper = KeychainStorageWrapper()
        return keychainWrapper
    }()
}
