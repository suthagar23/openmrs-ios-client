//
//  PatientServiceProtocol.swift
//  OpenMRS-iOS-Client
//
//  Created by Kailayapathy Suthagar on 5/24/19.
//  Copyright © 2019 OpenMRS. All rights reserved.
//

import Foundation

protocol PatientServiceProtocol {

    /**
     Search Patient
     - parameters:
         - q: Query string
         - v: Response Types (Default, Full, Ref) (Optional)
         - limit: Search limit (Optional)
         - startIndex: StartIndex of the rows (Optional)
         - identifier: Patient Identifier (Optional)
         - onSuccess: Success handler
         - patients: List of ObjectLite Model related to Patient
         - onError: Error handler
         - apiError: ApiResponseErrors Model
     */
    func searchPatients(q: String?,
                     v: APIResponseType?,
                     limit: String?,
                     startIndex: String?,
                     identifier: String?,
                     onSuccess: @escaping (_ response: PatientServiceSuccessResponses) -> Void,
                     onError: @escaping (_ apiError: ApiResponseErrors) -> Void)

}
