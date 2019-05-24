//
//  PersonName.swift
//  OpenMRS-iOS-Client
//
//  Created by Kailayapathy Suthagar on 5/24/19.
//  Copyright © 2019 OpenMRS. All rights reserved.
//

import Foundation

struct PersonName: Codable {
    var display: String?
    var uuid: String?
    var givenName: String?
    var middleName: String?
    var familyName: String?
    var familyName2: String?
    var voided: Bool?
    var links: [Link]?
    var resourceVersion: String?
}
