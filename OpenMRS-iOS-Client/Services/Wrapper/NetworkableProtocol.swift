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

protocol NetworkableProtocol {

    /// Moya provider for network access
    var provider: MoyaProvider<OpenMRSAPI> { get }

    /**
     API response validator based on the response codes
     - parameters:
         - response: API Response object from Moya Provider
         - onAPISuccess: Success handler
         - data: Data Model fetched from Response Object
         - onAPIFailure: Failure handler
         - apiResponseErrors: ApiResponseErrors Model
    */
    func validateAPIResponseCodes(response: Response, onAPISuccess: @escaping (_ data: Data) -> Void,
                                  onAPIFailure: @escaping (_ apiResponseErrors: ApiResponseErrors) -> Void)
}
