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
    case dev = "DEV"
    case prod = "PROD"
    
    static func getEnvironmentBaseURL() -> String {
        switch AppConfigs.Common.apiEnviroment {
        case .dev:
            return "https://demo.openmrs.org/openmrs/ws/rest/v1"
        case .prod:
            return "https://demo.openmrs.org/openmrs/ws/rest/v1"
        }
    }
}
