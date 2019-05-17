//
//  NetworkWrapper.swift
//  OpenMRS-iOS-Client
//
//  Created by Kailayapathy Suthagar on 5/17/19.
//  Copyright © 2019 OpenMRS. All rights reserved.
//

import Foundation
import Moya

public struct NetworkWrapper: Networkable {
    var provider = MoyaProvider<OpenMRSAPI>.init(plugins: [NetworkLoggerPlugin(verbose: true),
                                                       AuthPlugin()])
    public init() { }
}

struct AuthPlugin: PluginType {
    
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var authRequest = request
        if(Shared.authorizedToken != nil) {
            authRequest.addValue("Bearer " + Shared.authorizedToken!, forHTTPHeaderField: "Authorization")
        }
        return authRequest
    }
}
