//
//  AuditInfo.swift
//  OpenMRS-iOS-Client
//
//  Created by Kailayapathy Suthagar on 5/24/19.
//  Copyright © 2019 OpenMRS. All rights reserved.
//

import Foundation

struct AuditInfo: Codable {
    var creator: ObjectLite?
    var dateCreated: String?
    var createdBy: String?
    var dateChanged: String?
}
