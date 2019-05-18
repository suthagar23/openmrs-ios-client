//
//  AuthServiceProtocol.swift
//  OpenMRS-iOS-Client
//
//  Created by Kailayapathy Suthagar on 5/17/19.
//  Copyright © 2019 OpenMRS. All rights reserved.
//

import Foundation

protocol AuthServiceProtocol {

    /**
     Authenticate user method
     - parameters:
         - username: Username string
         - password: Password string
         - onSuccess: Success handler
        - auth: AuthResponse Model
         - onError: Error handler
        - apiError: ApiResponseErrors Model
    */
    func authenticateUser(userName: String?, password: String?, onSuccess: @escaping (_ auth: AuthResponse) -> Void,
                          onError: @escaping (_ apiError: ApiResponseErrors) -> Void)

}
