//
//  ApiErrorCodes.swift
//  OpenMRS-iOS-Client
//
//  Created by Kailayapathy Suthagar on 5/18/19.
//  Copyright © 2019 OpenMRS. All rights reserved.
//

import Foundation

public enum ApiErrorCodes: Int, Codable {
    // Error codes from BFF Server
    case success = 200
    case unauthorized = 400
    case internalServerError = 500
    case authenticationError = 401
    case invalidCredentials = 403
    case serviceUnavailable = 501
    case unknownResponseStatusCode = 100
    case requestedDataNotFound = 404
}

public extension ApiErrorCodes {
    var description: String {
        switch self {
        case .success:
            return "Success"
        case .unauthorized:
            return "Unauthorized access."
        case .internalServerError:
            return "Internal server error."
        case .authenticationError:
            return "Authentication error, Please check your credentials."
        case .invalidCredentials:
            return "Invalid credentials, Please check your credentials."
        case .serviceUnavailable:
            return "Service unavailable"
        case .unknownResponseStatusCode:
            return "Unknowd status code found in the API response."
        case .requestedDataNotFound:
            return "Cound not find the requested data."
        }
    }
}
