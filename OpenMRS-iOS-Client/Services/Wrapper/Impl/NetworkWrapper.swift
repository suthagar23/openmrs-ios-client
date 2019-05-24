//
//  NetworkWrapper.swift
//  OpenMRS-iOS-Client
//
//  Created by Kailayapathy Suthagar on 5/17/19.
//  Copyright © 2019 OpenMRS. All rights reserved.
//

import Foundation
import Moya

enum APIResponseType: String {
    case fullType = "full"
    case defaultType = "default"
    case refType = ""
}

public struct NetworkWrapper: NetworkableProtocol {
    var provider = MoyaProvider<OpenMRSAPI>.init(plugins: [NetworkLoggerPlugin(verbose: true),
                                                           AuthPlugin()])

    public init() { }
}

struct AuthPlugin: PluginType {

    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var authRequest = request
        if(Shared.authorizedToken != nil) {
            authRequest.addValue("Basic " + Shared.authorizedToken!, forHTTPHeaderField: "Authorization")
        }
        return authRequest
    }
}

extension NetworkWrapper {

    func validateAPIResponseCodes(response: Response, onAPISuccess: @escaping (_ data: Data) -> Void,
                             onAPIFailure: @escaping (_ apiResponseErrors: ApiResponseErrors) -> Void) {
        let statusCode: Int = response.statusCode
        if statusCode == 200 {
            onAPISuccess(response.data)
        } else if statusCode == 400 || statusCode == 401 {
            onAPIFailure(ApiResponseErrors.authError(errorCode: ApiErrorCodes.authenticationError))
        } else if statusCode == 500 {
            onAPIFailure(ApiResponseErrors.authError(errorCode: ApiErrorCodes.internalServerError))
        } else {
            onAPIFailure(ApiResponseErrors.unknownError(errorCode: ApiErrorCodes.unknownResponseStatusCode))
        }
    }
}
