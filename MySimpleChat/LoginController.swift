//
//  LoginController.swift
//  MySimpleChat
//
//  Created by Eric Grant on 14.06.2020.
//  Copyright © 2020 Eric Grant. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class LoginController: UIViewController {
    
    // MARK: - Properties
    
    let greetingLabel = UILabel(text: "welcome back!", font: .avenir26(), textColor: .white)
    
    let loginWithLabel = UILabel(text: "Login with", textColor: .white)
    let orLabel = UILabel(text: "or", textColor: .white)
    let emailLabel = UILabel(text: "Email", textColor: .white)
    let passwordLabel = UILabel(text: "Password", textColor: .white)
    let dontHaveAccountLabel = UILabel(text: "on't have an account?", textColor: .white)
    
    let googleButton = UIButton(title: "Google",
                                titleColor: .black,
                                backgroundColor: .white,
                                isShadow: true)
    let emailTextField = TextFieldFormView(font: .avenir20())
    let passwordTextField = TextFieldFormView(font: .avenir20())
    let loginButton = UIButton(title: "Login",
                               titleColor: .buttonRed(),
                               backgroundColor: .white,
                               isShadow: true)
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.buttonRed(), for: .normal)
        button.titleLabel?.font = .avenir20()
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
    }
}

// MARK: - SwiftUI

struct LoginControllerProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let loginUpVC = LoginController()
        
        func makeUIViewController(context: Context) -> LoginController {
            return loginUpVC
        }
        
        func updateUIViewController(_ uiViewController: LoginController, context: Context) {
            
        }
    }
}
