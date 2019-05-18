//
//  SharedInstances.swift
//  OpenMRS-iOS-Client
//
//  Created by Kailayapathy Suthagar on 5/17/19.
//  Copyright © 2019 OpenMRS. All rights reserved.
//

import Foundation

class Shared {

    static var authorizedToken: String?

    /// Shared NetworkManager which can handles the BffRequests
    static var sharedNetworWrapper: NetworkWrapper = {
        var networkWrapper = NetworkWrapper()
        return networkWrapper
    }()
}
