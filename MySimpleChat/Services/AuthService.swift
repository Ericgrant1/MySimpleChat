//
//  AuthService.swift
//  MySimpleChat
//
//  Created by Eric Grant on 08.07.2020.
//  Copyright © 2020 Eric Grant. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class AuthService {
    
    static let shared = AuthService()
    private let auth = Auth.auth()
    
    func register(email: String?, password: String?, confirmPassword: String?, completion: @escaping(Result<User, Error>) -> Void) {
        auth.createUser(withEmail: email!, password: password!) { (result, error) in
            guard let result = result else {
                completion(.failure(error!))
                return
            }
            completion(.success(result.user))
        }
    }
}
