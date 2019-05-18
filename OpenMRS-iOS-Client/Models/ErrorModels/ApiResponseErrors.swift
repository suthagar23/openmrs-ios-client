//
//  ApiResponseErrors.swift
//  OpenMRS-iOS-Client
//
//  Created by Kailayapathy Suthagar on 5/17/19.
//  Copyright © 2019 OpenMRS. All rights reserved.
//

import Foundation

public enum ApiResponseErrors: Error {
    case requestFailed(stack: Error)
    case JSONDecodeFailed(stack: Error)
    case authError(errorCode: ApiErrorCodes)
    case internalServerError(errorCode: ApiErrorCodes)
    case unknownError(errorCode: ApiErrorCodes)
}

public extension ApiResponseErrors {
    var errorCode: Int {
        switch self {
        case .requestFailed:
            return 4041
        case .JSONDecodeFailed:
            return 4042
        case .authError(let code):
            return code.rawValue
        case .internalServerError(let code):
            return code.rawValue
        case .unknownError(let code):
            return code.rawValue
        }
    }
}

public extension ApiResponseErrors {
    var description: String {
        switch self {
        case .requestFailed:
            return "SD\(self.errorCode) - Could not make the API request"
        case .JSONDecodeFailed:
            return "SD\(self.errorCode) - Could not decode to model from JSON response"
        case .authError(let errorCode):
            return "SD\(errorCode.rawValue) - \(errorCode.description)"
        case .internalServerError(let errorCode):
            return "SD\(errorCode.rawValue) - \(errorCode.description)"
        case .unknownError(let errorCode):
            return "SD\(errorCode.rawValue) - Unexpected error occured. Please contact our support."
        }
    }
}
