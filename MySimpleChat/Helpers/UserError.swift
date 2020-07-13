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
}

extension UserError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .notPopulated:
            return NSLocalizedString("Fill in all the fields", comment: "")
        case .photoNotExist:
            return NSLocalizedString("User did not select photo", comment: "")
        }
    }
}
