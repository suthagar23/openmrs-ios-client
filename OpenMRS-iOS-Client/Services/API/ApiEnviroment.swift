//
//  ApiEnviroment.swift
//  OpenMRS-iOS-Client
//
//  Created by Kailayapathy Suthagar on 5/17/19.
//  Copyright © 2019 OpenMRS. All rights reserved.
//

import Foundation

/**
 APIEnviroments as an enum
 - dev: Development enviroment
 - prod: Production enviroment
 */
public enum APIEnvironment: String {
    case demo = "demo"
    case moduleRefApp = "Modules"

    static func getEnvironmentBaseURL() -> String {
        switch AppConfigs.Common.apiEnviroment {
        case .demo:
            return "https://demo.openmrs.org/openmrs/ws/rest/v1"
        case .moduleRefApp:
            return "https://modules-refapp.openmrs.org/openmrs/ws/rest/v1"
        }
    }
}
