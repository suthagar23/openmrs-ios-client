//
//  OpenMRSAPI.swift
//  OpenMRS-iOS-Client
//
//  Created by Kailayapathy Suthagar on 5/17/19.
//  Copyright © 2019 OpenMRS. All rights reserved.
//

import Foundation
import Moya

enum OpenMRSAPI {
    //auth
    case login (username:String, password:String)
}

extension OpenMRSAPI: TargetType {
    
    var environmentBaseURL: String {
        return APIEnvironment.getEnvironmentBaseURL()
    }
    
    var baseURL: URL {
        guard let url =  URL (string: environmentBaseURL) else {
            fatalError("Couldn't configure the baseURL")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .login: return "/session"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login: return .get
        }
    }
    
    var task: Task {
        switch self {
        case .login (let username, let password):
            return .requestParameters(parameters: ["username": username, "password": password], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return ["content-type": "application/json"]
    }
    
    var sampleData: Data {
        switch self {
        case .login:
            return stubbedResponse("Login")
        }
    }
    
    func stubbedResponse(_ filename: String) -> Data! {
        @objc class TestClass: NSObject { }
        let bundle = Bundle(for: TestClass.self)
        let path = bundle.path(forResource: filename, ofType: "json")
        return (try? Data(contentsOf: URL(fileURLWithPath: path!)))
    }
}
