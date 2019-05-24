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
    case login (username: String, password: String)
    case searchPatients(q: String, v: APIResponseType, limit: String, startIndex: String, identifier: String)
    case getPatient(uuid: String, v: APIResponseType)
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
        case .searchPatients: return "/patient"
        case .getPatient(let uuid, _):
            return "/patient/\(uuid)"
        }
    }

    var method: Moya.Method {
        switch self {
        case .login: return .get
        case .searchPatients: return .get
        case .getPatient: return .get
        }
    }

    var task: Task {
        switch self {
        case .login (let username, let password):
            return .requestParameters(parameters: ["username": username, "password": password], encoding: URLEncoding.queryString)
        case .searchPatients(let q, let v, let limit, let startIndex, let identifier):
            var params = ["q": q, "limit": limit, "startIndex": startIndex, "identifier": identifier]
            if v != .refType { params["v"] = v.rawValue }
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        case .getPatient(_, let v):
            return .requestParameters(parameters: v != .defaultType ? ["v": v.rawValue] : [:], encoding: URLEncoding.queryString)
        }
    }

    var headers: [String: String]? {
        var headers = ["content-type": "application/json"]
        switch self {
        case .login(let username, let password):
            let base64LoginString = "\(username):\(password)".base64EncodedString
            headers["Authorization"] = "Basic \(base64LoginString)"
            return headers
        default:
            return headers
        }
    }

    var sampleData: Data {
        return stubbedResponse("Sample")
    }

    func stubbedResponse(_ filename: String) -> Data! {
        @objc class TestClass: NSObject { }
        let bundle = Bundle(for: TestClass.self)
        let path = bundle.path(forResource: filename, ofType: "json")
        return (try? Data(contentsOf: URL(fileURLWithPath: path!)))
    }
}
