//
//  Patient.swift
//  OpenMRS-iOS-Client
//
//  Created by Kailayapathy Suthagar on 5/24/19.
//  Copyright © 2019 OpenMRS. All rights reserved.
//

import Foundation

struct Patient: Codable {
    var uuid: String?
    var display: String?
    var identifiers: [Identifier]?
    var person: Person?
    var voided: Bool?
    var auditInfo: AuditInfo?
    var links: [Link]?
    var resourceVersion: String?
}
