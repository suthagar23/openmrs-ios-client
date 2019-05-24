//
//  Identifier.swift
//  OpenMRS-iOS-Client
//
//  Created by Kailayapathy Suthagar on 5/24/19.
//  Copyright © 2019 OpenMRS. All rights reserved.
//

import Foundation

struct Identifier: Codable {
    var display: String?
    var uuid: String?
    var identifier: String?
    var identifierType: ObjectLite?
    var location: ObjectLite?
    var preferred: Bool?
    var voided: Bool?
    var links: [Link]?
    var resourceVersion: String?
}
