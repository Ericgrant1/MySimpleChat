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

protocol AuthNavigationDelegate: class {
    func handleToLoginVC()
    func handleToSignUpVC()
}

class LoginController: UIViewController {
    
    // MARK: - Properties
    
    let greetingLabel = UILabel(text: "Welcome back!", font: .avenir26(), textColor: .white)
    
    let loginWithLabel = UILabel(text: "Login with", textColor: .white)
    let orLabel = UILabel(text: "or", textColor: .white)
    let emailLabel = UILabel(text: "Email", textColor: .white)
    let passwordLabel = UILabel(text: "Password", textColor: .white)
    let dontHaveAccountLabel = UILabel(text: "Don't have an account?", textColor: .white)
    
    let googleButton = UIButton(title: "Google",
                                titleColor: .black,
                                backgroundColor: .white,
                                isShadow: true)
    let emailTextField = TextFieldFormView(font: .avenir20())
    let passwordTextField = TextFieldFormView(font: .avenir20())
    let loginButton = UIButton(title: "Login",
                               titleColor: .white,
                               backgroundColor: .buttonDark())
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.buttonRed(), for: .normal)
        button.titleLabel?.font = .avenir20()
        return button
    }()
    
    weak var delegate: AuthNavigationDelegate?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        googleButton.customizedGoogleButton()
        configureUI()
        
        loginButton.addTarget(self, action: #selector(handleLoginTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(handleSignUpTapped), for: .touchUpInside)
    }
    
    // MARK: - Selectors
    
    @objc private func handleLoginTapped() {
        print(#function)
        AuthService.shared.login(email: emailTextField.text, password: passwordTextField.text) { (result) in
            switch result {
            case .success(let user):
                self.showAlert(with: "Successfully!", and: "You're authorized!")
            case .failure(let error):
                self.showAlert(with: "Error!", and: error.localizedDescription)
            }
        }
    }
    
    @objc private func handleSignUpTapped() {
        dismiss(animated: true) {
            self.delegate?.handleToSignUpVC()
        }
    }
}

// MARK: - Setup constraints

extension LoginController {
    
    private func configureUI() {
        
        let loginWithView = ButtonFormView(label: loginWithLabel, button: googleButton)
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField],
                                         axis: .vertical,
                                         spacing: 0)
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField],
                                         axis: .vertical,
                                         spacing: 0)
        
        loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        let stackView = UIStackView(arrangedSubviews: [loginWithView, orLabel, emailStackView, passwordStackView, loginButton],
                                    axis: .vertical,
                                    spacing: 40)
        
        signUpButton.contentHorizontalAlignment = .leading
        let bottomStackView = UIStackView(arrangedSubviews: [dontHaveAccountLabel, signUpButton],
                                          axis: .horizontal,
                                          spacing: 20)
        bottomStackView.alignment = .firstBaseline
        
        greetingLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(greetingLabel)
        view.addSubview(stackView)
        view.addSubview(bottomStackView)
        
        NSLayoutConstraint.activate([
            greetingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            greetingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
             stackView.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 100),
             stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
             stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
         ])
         
         NSLayoutConstraint.activate([
             bottomStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
             bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
             bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
         ])
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
