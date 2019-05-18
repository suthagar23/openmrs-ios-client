//
//  ObjectLite.swift
//  OpenMRS-iOS-Client
//
//  Created by Kailayapathy Suthagar on 5/17/19.
//  Copyright © 2019 OpenMRS. All rights reserved.
//

import Foundation

struct ObjectLite: Codable {
    var uuid: String?
    var display: String?
    var links: [Link]?
}
