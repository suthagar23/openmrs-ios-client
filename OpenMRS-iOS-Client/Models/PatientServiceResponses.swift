//
//  PatientServiceResponses.swift
//  OpenMRS-iOS-Client
//
//  Created by Kailayapathy Suthagar on 5/24/19.
//  Copyright © 2019 OpenMRS. All rights reserved.
//

import Foundation

struct GetPatientsRefResponse: Codable {
    var results: [ObjectLite]?
}

struct GetPatientsFullResponse: Codable {
    var results: [Patient]?
}
