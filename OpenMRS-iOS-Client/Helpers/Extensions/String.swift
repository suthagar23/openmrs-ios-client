//
//  String.swift
//  OpenMRS-iOS-Client
//
//  Created by Kailayapathy Suthagar on 5/18/19.
//  Copyright © 2019 OpenMRS. All rights reserved.
//

import Foundation

extension String {

    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }

    var base64EncodedString: String {
        return data(using: .utf8)!.base64Encoded
    }
}
