//
//  KeychainStorageWrapper.swift
//  OpenMRS-iOS-Client
//
//  Created by Kailayapathy Suthagar on 5/17/19.
//  Copyright © 2019 OpenMRS. All rights reserved.
//

import Foundation
import KeychainAccess

/// Keychain Storage Wrapper class which contains implementation for keychain access
class KeychainStorageWrapper: KeychainStorageWrapperProtocol {
    
    private let keychainWrapper: Keychain
    
    /// Shared KeychainWrapper instance among all the classes
    static var sharedKeychainWrapper: KeychainStorageWrapper = {
        let keychainWrapper = KeychainStorageWrapper()
        return keychainWrapper
    }()
    
    private init() {
        keychainWrapper = Keychain(service: AppConfigs.KeychainConfigs.serviceName,
                                   accessGroup: AppConfigs.KeychainConfigs.accessGroup)
            .accessibility(.whenUnlocked)
            .synchronizable(AppConfigs.KeychainConfigs.iOSCloudSync)
    }
    
    func setString(_ value: String, key forKey: String) throws -> Bool? {
        do {
            try keychainWrapper.set(value, key: forKey)
            return true
        } catch let error {
            throw KeyChainErrors.setStringError(key: generateSharedKey(key: forKey), stack: error.localizedDescription)
        }
    }
    
    func getString(_ forKey: String) throws -> String? {
        do {
            return try keychainWrapper.get(forKey)
        } catch let error {
            throw KeyChainErrors.getStringError(key: generateSharedKey(key: forKey), stack: error.localizedDescription)
        }
    }
    
    func setData(_ data: Data, key forKey: String) throws -> Bool? {
        do {
            try keychainWrapper.set(data, key: forKey)
            return true
        } catch let error {
            throw KeyChainErrors.setDataError(key: generateSharedKey(key: forKey), stack: error.localizedDescription)
        }
    }
    
    func getData(_ forKey: String) throws -> Data? {
        do {
            return try keychainWrapper.getData(forKey)
        } catch let error {
            throw KeyChainErrors.getDataError(key: generateSharedKey(key: forKey), stack: error.localizedDescription)
        }
    }
    
    func removeItem(_ forKey: String) throws ->  Bool? {
        do {
            try keychainWrapper.remove(forKey)
            return true
        } catch let error {
            throw KeyChainErrors.removeItemError(key: generateSharedKey(key: forKey), stack: error.localizedDescription)
        }
    }
    
    func getAllKeys() -> [String] {
        return keychainWrapper.allKeys()
    }
    
    func getAllItems() -> [[String: Any]] {
        return keychainWrapper.allItems()
    }
    
    // creationDate, Creator, accessGroup, ServiceName can be accessed through this method
    func getItemAttributes(_ forKey: String) throws -> Attributes? {
        do {
            return try keychainWrapper.get(forKey) { $0 }
        } catch let error {
            throw KeyChainErrors.getAttributeError(key: generateSharedKey(key: forKey), stack: error.localizedDescription)
        }
    }
}

extension KeychainStorageWrapper {
    
    /**
     Generate custom key names
     - parameters:
     - key: actual key name
     - returns: generated key name
     */
    func generateSharedKey(key: String) -> String {
        return "\(AppConfigs.KeychainConfigs.keyPrefix)-\(key)"
    }
}
