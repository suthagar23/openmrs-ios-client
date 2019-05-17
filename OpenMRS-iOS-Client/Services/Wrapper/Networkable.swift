//
//  Networkable.swift
//  OpenMRS-iOS-Client
//
//  Created by Kailayapathy Suthagar on 5/17/19.
//  Copyright © 2019 OpenMRS. All rights reserved.
//

import Foundation

import Foundation
import Moya

protocol Networkable {
    var provider: MoyaProvider<OpenMRSAPI> { get }
}
