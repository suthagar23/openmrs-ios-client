//
//  CustomArrayOrDic.swift
//  OpenMRS-iOS-Client
//
//  Created by Kailayapathy Suthagar on 5/24/19.
//  Copyright © 2019 OpenMRS. All rights reserved.
//

import Foundation

public enum CustomArrayOrDic: Codable {
    case array([String]?)
    case dic([String: String?]?)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([String]?.self) {
            self = .array(x)
            return
        }
        if let x = try? container.decode([String: String?]?.self) {
            self = .dic(x)
            return
        }
        throw DecodingError.typeMismatch(CustomArrayOrDic.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Unknown type"))
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .array(let x):
            try container.encode(x)
        case .dic(let x):
            try container.encode(x)
        }
    }
}
