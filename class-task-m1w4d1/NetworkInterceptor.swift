//
//  NetworkInterceptor.swift
//  class-task-m1w4d1
//
//  Created by Mac on 24/09/1446 AH.
//
import Alamofire
import Foundation
class NetworkInterceptor: RequestInterceptor {
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var request = urlRequest

        // Retrieve the token from the keychain
        if let token = KeychainHelper.shared.getToken() {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }

        completion(.success(request))
    }
}
