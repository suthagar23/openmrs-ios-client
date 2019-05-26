//
//  PatientServiceImpl.swift
//  OpenMRS-iOS-Client
//
//  Created by Kailayapathy Suthagar on 5/24/19.
//  Copyright © 2019 OpenMRS. All rights reserved.
//

import Foundation

enum SearchPatientsSuccessResponses {
    case onSuccessDefault(patient: GetPatientsFullResponse)
    case onSuccessFull(patient: GetPatientsFullResponse)
    case onSuccessRef(patient: GetPatientsRefResponse)
}

enum GetPatientsSuccessResponses {
    case onSuccessDefault(patient: Patient)
    case onSuccessFull(patient: Patient)
    case onSuccessRef(patient: ObjectLite)
}

extension NetworkWrapper: PatientServiceProtocol {

    func searchPatients(q: String?,
                          v: APIResponseType? = APIResponseType.refType,
                          limit: String? = "",
                          startIndex: String? = "",
                          identifier: String? = "",
                          onSuccess: @escaping (_ response: SearchPatientsSuccessResponses) -> Void,
                          onError: @escaping (_ apiError: ApiResponseErrors) -> Void) {
        provider.request(.searchPatients(q: q!, v: v!, limit: limit!, startIndex: startIndex!, identifier: identifier!)) { result in
            switch result {
            case let .success(response):
                self.validateAPIResponseCodes(response: response, onAPISuccess: { data in
                    do {
                        switch v! {
                        case .refType:
                            let results = try JSONDecoder().decode(GetPatientsRefResponse.self, from: data)
                            onSuccess(.onSuccessRef(patient: results))
                        case .defaultType:
                            let results = try JSONDecoder().decode(GetPatientsFullResponse.self, from: data)
                            onSuccess(.onSuccessDefault(patient: results))
                        case .fullType:
                            let results = try JSONDecoder().decode(GetPatientsFullResponse.self, from: data)
                            onSuccess(.onSuccessFull(patient: results))
                        }
                    } catch let error {
                        onError(ApiResponseErrors.JSONDecodeFailed(stack: error))
                    }
                }, onAPIFailure: { apiResponseError in
                    onError(apiResponseError)
                })
            case let .failure(error):
                onError(ApiResponseErrors.requestFailed(stack: error))
                print(error.errorDescription!)
            }
        }
    }
    
    func getPatient(uuid: String?,
                        v: APIResponseType? = APIResponseType.refType,
                        onSuccess: @escaping (_ response: GetPatientsSuccessResponses) -> Void,
                        onError: @escaping (_ apiError: ApiResponseErrors) -> Void) {
        provider.request(.getPatient(uuid: uuid!, v: v!)) { result in
            switch result {
            case let .success(response):
                self.validateAPIResponseCodes(response: response, onAPISuccess: { data in
                    do {
                        switch v! {
                        case .refType:
                            let results = try JSONDecoder().decode(ObjectLite.self, from: data)
                            onSuccess(.onSuccessRef(patient: results))
                        case .defaultType:
                            let results = try JSONDecoder().decode(Patient.self, from: data)
                            onSuccess(.onSuccessDefault(patient: results))
                        case .fullType:
                            let results = try JSONDecoder().decode(Patient.self, from: data)
                            onSuccess(.onSuccessFull(patient: results))
                        }
                    } catch let error {
                        onError(ApiResponseErrors.JSONDecodeFailed(stack: error))
                    }
                }, onAPIFailure: { apiResponseError in
                    onError(apiResponseError)
                })
            case let .failure(error):
                onError(ApiResponseErrors.requestFailed(stack: error))
                print(error.errorDescription!)
            }
        }
    }
}
