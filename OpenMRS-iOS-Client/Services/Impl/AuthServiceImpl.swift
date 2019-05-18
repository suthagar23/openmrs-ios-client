//
//  AuthServiceImpl.swift
//  OpenMRS-iOS-Client
//
//  Created by Kailayapathy Suthagar on 5/17/19.
//  Copyright © 2019 OpenMRS. All rights reserved.
//

import Foundation

extension NetworkWrapper: AuthServiceProtocol {

    func authenticateUser(userName: String?,
                          password: String?,
                          onSuccess: @escaping (_ auth: AuthResponse) -> Void,
                          onError: @escaping (_ apiError: ApiResponseErrors) -> Void) {
        // Authenticate User
        provider.request(.login(username: userName!, password: password!)) { result in
            switch result {
            case let .success(response):
                self.validateAPIResponseCodes(response: response, onAPISuccess: { data in
                    do {
                        let results = try JSONDecoder().decode(AuthResponse.self, from: data)
                        onSuccess(results)
                    } catch let error {
                        onError(ApiResponseErrors.JSONDecodeFailed(stack: error))
                    }
                }, onAPIFailure: { apiResponseError in
                    onError(apiResponseError)
                })
            case let .failure(error):
                print(error.errorDescription!)
            }
        }
    }
}
