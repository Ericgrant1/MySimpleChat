//
//  UserError.swift
//  MySimpleChat
//
//  Created by Eric Grant on 14.07.2020.
//  Copyright © 2020 Eric Grant. All rights reserved.
//

import Foundation

enum UserError {
    case notPopulated
    case photoNotExist
    case cannotUnwrapToModelUser
    case cannotGetUserInfo
    
}

extension UserError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .notPopulated:
            return NSLocalizedString("Fill in all the fields", comment: "")
        case .photoNotExist:
            return NSLocalizedString("User did not select photo", comment: "")
        case .cannotUnwrapToModelUser:
            return NSLocalizedString("Unable to convert ModelUser from User", comment: "")
        case .cannotGetUserInfo:
            return NSLocalizedString("Unable to load User information from Firebase", comment: "")
        }
    }
}
