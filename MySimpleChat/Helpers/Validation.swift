//
//  Verification.swift
//  MySimpleChat
//
//  Created by Eric Grant on 09.07.2020.
//  Copyright © 2020 Eric Grant. All rights reserved.
//

import Foundation

class Validation {
    
    static func isFieled(email: String?, password: String?, confirmPassword: String?) -> Bool {
        guard let password = password,
        let confirmPassword = confirmPassword,
        let email = email,
        password != "",
        confirmPassword != "",
            email != "" else {
                return false
        }
        return true
    }
    
    static func isSimpleEmail(_ email: String) -> Bool {
        let emailRegEx = "^.+@.+\\..{2,}$"
        return check(text: email, regEx: emailRegEx)
    }
    
    private static func check(text: String, regEx: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
        return predicate.evaluate(with: text)
    }
    
}
