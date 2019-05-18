//
//  KeychainStorageWrapperProtocol.swift
//  OpenMRS-iOS-Client
//
//  Created by Kailayapathy Suthagar on 5/17/19.
//  Copyright © 2019 OpenMRS. All rights reserved.
//

import Foundation
import KeychainAccess

protocol KeychainStorageWrapperProtocol {

    /// Shared KeychainWrapper instance among all the classes
    static var sharedKeychainWrapper: KeychainStorageWrapper { get }

    // Set string value to Keychain storage
    func setString(_ value: String, key forKey: String) throws -> Bool?

    // get string value from Keychain storage
    func getString(_ forKey: String) throws -> String?

    // Set data value to Keychain storage
    func setData(_ data: Data, key forKey: String) throws -> Bool?

    // get data value from Keychain storage
    func getData(_ forKey: String) throws -> Data?

    // remove item from the Keychain storage
    func removeItem(_ forKey: String) throws ->  Bool?

    // get all keys from the Keychain storage
    func getAllKeys() -> [String]

    // get all items from the Keychain storage
    func getAllItems() -> [[String: Any]]

    // creationDate, Creator, accessGroup, ServiceName can be accessed through this method
    func getItemAttributes(_ forKey: String) throws -> Attributes?

    // generate shared custom key
    func generateSharedKey(key: String) -> String
}
