//
//  AuthNavigationDelegate.swift
//  MySimpleChat
//
//  Created by Eric Grant on 12.07.2020.
//  Copyright © 2020 Eric Grant. All rights reserved.
//

import Foundation

protocol AuthNavigationDelegate: class {
    func handleToLoginVC()
    func handleToSignUpVC()
}
