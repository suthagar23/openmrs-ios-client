//
//  User.swift
//  OpenMRS-iOS-Client
//
//  Created by Kailayapathy Suthagar on 5/17/19.
//  Copyright © 2019 OpenMRS. All rights reserved.
//

import Foundation

struct User: Codable {
    var uuid: String?
    var display: String?
    var username: String?
    var systemId: String?
    var userProperties: CustomArrayOrDic?
    var person: ObjectLite?
    var privileges: [ObjectLite]?
    var roles: [ObjectLite]?
    var retried: Bool?
    var links: [Link]?
    var resourceVersion: String?
}
