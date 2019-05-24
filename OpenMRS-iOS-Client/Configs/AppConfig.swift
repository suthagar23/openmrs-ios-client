//
//  AppConfig.swift
//  OpenMRS-iOS-Client
//
//  Created by Kailayapathy Suthagar on 5/17/19.
//  Copyright © 2019 OpenMRS. All rights reserved.
//

import Foundation

class AppConfigs {

    struct Common {
        static let apiEnviroment: APIEnvironment = .demo
    }

    struct KeychainConfigs {
        static let serviceName: String = "com.openmrs.ios"
        static let accessGroup: String = "key.com.openmrs.ios"
        static let keyPrefix: String = "openmrs-"
        static let iOSCloudSync: Bool = false // turn off synchronizing keychain items with iCloud
    }
}
