//
//  AuthError.swift
//  MySimpleChat
//
//  Created by Eric Grant on 09.07.2020.
//  Copyright © 2020 Eric Grant. All rights reserved.
//

import Foundation

enum AuthError {
    case notPopulated
    case invalidEmail
    case passwordNotMatch
    case unknownError
    case serverError
}

extension AuthError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .notPopulated:
            return NSLocalizedString("Fill in all the fields", comment: "")
        case .invalidEmail:
            return NSLocalizedString("Invalid email format", comment: "")
        case .passwordNotMatch:
            return NSLocalizedString("Password mismatch", comment: "")
        case .unknownError:
            return NSLocalizedString("Unknown error", comment: "")
        case .serverError:
            return NSLocalizedString("Ыerver error", comment: "")
        }
    }
}
