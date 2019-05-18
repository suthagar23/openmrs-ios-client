//
//  AuthenticationResponse.swift
//  OpenMRS-iOS-Client
//
//  Created by Kailayapathy Suthagar on 5/17/19.
//  Copyright © 2019 OpenMRS. All rights reserved.
//

import Foundation

struct AuthResponse: Codable {
    var sessionId: String?
    var authenticated: Bool?
    var user: User?
    var locale: String?
    var allowedLocales: [String]?
}
