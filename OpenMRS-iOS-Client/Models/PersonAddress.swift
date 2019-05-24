//
//  PersonAddress.swift
//  OpenMRS-iOS-Client
//
//  Created by Kailayapathy Suthagar on 5/24/19.
//  Copyright © 2019 OpenMRS. All rights reserved.
//

import Foundation

struct PersonAddress: Codable {
    var display: String?
    var uuid: String?
    var preferred: Bool?
    var address1: String?
    var address2: String?
    var cityVillage: String?
    var stateProvince: String?
    var country: String?
    var postalCode: String?
    var voided: Bool?
    var links: [Link]?
    var resourceVersion: String?
}
