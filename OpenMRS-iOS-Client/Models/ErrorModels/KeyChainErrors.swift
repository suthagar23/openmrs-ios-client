//
//  KeyChainErrors.swift
//  OpenMRS-iOS-Client
//
//  Created by Kailayapathy Suthagar on 5/17/19.
//  Copyright © 2019 OpenMRS. All rights reserved.
//

import Foundation

enum KeyChainErrors: Error {
    case setStringError(key: String, stack: String)
    case getStringError(key: String, stack: String)
    case setDataError(key: String, stack: String)
    case getDataError(key: String, stack: String)
    case getAttributeError(key: String, stack: String)
    case removeItemError(key: String, stack: String)
    case JSONEncodeError(stack: Error)
    case JSONDecodeError(stack: Error)
    case unknownError
}

extension KeyChainErrors {
    var errorCode: String {
        switch self {
        case .setStringError:
            return "KC001"
        case .getStringError:
            return "KC002"
        case .setDataError:
            return "KC003"
        case .getDataError:
            return "KC004"
        case .getAttributeError:
            return "KC005"
        case .removeItemError:
            return "KC005"
        case .JSONEncodeError:
            return "KC006"
        case .JSONDecodeError:
            return "KC007"
        case .unknownError:
            return "KC008"
        }
    }

    var description: String {
        switch self {
        case .setStringError(let forKey, _):
            return "Error occured while storing string in Keychain storage (Key: " + forKey + ")"
        case .getStringError(let forKey, _):
            return "Error occured while getting string from Keychain storage (Key: " + forKey + ")"
        case .setDataError(let forKey, _):
            return "Error occured while storing data to Keychain storage (Key: " + forKey + ")"
        case .getDataError(let forKey, _):
            return "Error occured while getting data from Keychain storage (Key: " + forKey + ")"
        case .getAttributeError(let forKey, _):
            return "Error occured while getting attribures of Keychain items (Key: " + forKey + ")"
        case .removeItemError(let forKey, _):
            return "Error occured while removing item from Keychain storage (Key: " + forKey + ")"
        case .JSONEncodeError:
            return "SD\(self.errorCode) - Couldn't encode the data from the model"
        case .JSONDecodeError:
            return "SD\(self.errorCode) - Couldn't decode from the data to model"
        case .unknownError:
            return "SD\(self.errorCode) - Unknown error occured, Please contact our support"
        }
    }
}
