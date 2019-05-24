//
//  Person.swift
//  OpenMRS-iOS-Client
//
//  Created by Kailayapathy Suthagar on 5/24/19.
//  Copyright © 2019 OpenMRS. All rights reserved.
//

import Foundation

struct Person: Codable {
    var display: String?
    var uuid: String?
    var gender: String?
    var age: Int?
    var birthDate: String?
    var birthdateEstimated: Bool?
    var dead: Bool?
    var causeOfDead: String?
    var preferredName: PersonName?
    var preferredAddress: PersonAddress?
    var attributes: CustomArrayOrDic?
    var voided: Bool?
    var auditInfo: AuditInfo?
    var deathdateEstimated: Bool?
    var birthtime: String?
    var links: [Link]?
    var resourceVersion: String?
}
