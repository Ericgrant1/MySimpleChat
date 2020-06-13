//
//  SignUpController.swift
//  MySimpleChat
//
//  Created by Eric Grant on 13.06.2020.
//  Copyright © 2020 Eric Grant. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class SignUpController: UIViewController {
    
    // MARK: - Properties
    
    let greetingLabel = UILabel(text: "Good to see you!", font: .avenir26(), textColor: .white)
    
    let emailLabel = UILabel(text: "Email", textColor: .white)
    let passwordLabel = UILabel(text: "Password", textColor: .white)
    let confirmPasswordLabel = UILabel(text: "Confirm password", textColor: .white)
    let alreadyHaveAccountLabel = UILabel(text: "Already have an account? ", textColor: .white)
    
    let emailTextField = TextFieldFormView(font: .avenir20())
    let passwordTextField = TextFieldFormView(font: .avenir20())
    let alreadyHaveAccounTextField = TextFieldFormView(font: .avenir20())
    
    let signUpButton = UIButton(title: "Sign Up", titleColor: .white, backgroundColor: .buttonDark(), cornerRadius: 4)
    let loginButton = UIButton()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.buttonRed(), for: .normal)
        view.backgroundColor = .green
    }
    
    // MARK: - Helper functions
    
}

// MARK: - SwiftUI

struct SignUpControllerProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let signUpVC = SignUpController()
        
        func makeUIViewController(context: Context) -> SignUpController {
            return signUpVC
        }
        
        func updateUIViewController(_ uiViewController: SignUpController, context: Context) {
            
        }
    }
}
