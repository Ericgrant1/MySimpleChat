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
    let alreadyHaveAccountLabel = UILabel(text: "Already have an account?", textColor: .white)
    
    let emailTextField = TextFieldFormView(font: .avenir20())
    let passwordTextField = TextFieldFormView(font: .avenir20())
    let confirmPasswordTextField = TextFieldFormView(font: .avenir20())
    
    let signUpButton = UIButton(title: "Sign Up", titleColor: .white, backgroundColor: .buttonDark(), cornerRadius: 4)
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.buttonRed(), for: .normal)
        button.titleLabel?.font = .avenir20()
        return button
        }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        
        configureUI()
        
        signUpButton.addTarget(self, action: #selector(handleSignupTapped), for: .touchUpInside)
    }
    
    // MARK: - Selectors
    
    @objc private func handleSignupTapped() {
        print(#function)
        AuthService.shared.register(email: emailTextField.text, password: passwordTextField.text, confirmPassword: confirmPasswordTextField.text) { (result) in
            switch result {
            case .success(let user):
                self.showAlert(with: "Successfully!", and:  "You're registered!")
                print("DEBUG: \(user.email)")
            case .failure(let error):
                self.showAlert(with: "Error!", and: error.localizedDescription)
            }
        }
    }
}

// MARK: - Setup constraints

extension SignUpController {
    
    private func configureUI() {
        
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField],
                                         axis: .vertical,
                                         spacing: 0)
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField],
                                            axis: .vertical,
                                            spacing: 0)
        let confirmStackView = UIStackView(arrangedSubviews: [confirmPasswordLabel, confirmPasswordTextField],
                                           axis: .vertical,
                                           spacing: 0)
        
        signUpButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [emailStackView, passwordStackView, confirmStackView, signUpButton],
                                    axis: .vertical,
                                    spacing: 40)
        
        loginButton.contentHorizontalAlignment = .leading
        let bottomStackView = UIStackView(arrangedSubviews: [alreadyHaveAccountLabel, loginButton],
                                          axis: .horizontal,
                                          spacing: 20)
        bottomStackView.alignment = .firstBaseline
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        greetingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(greetingLabel)
        view.addSubview(stackView)
        view.addSubview(bottomStackView)
        
        NSLayoutConstraint.activate([
            greetingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            greetingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 160),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            bottomStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 60),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
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

extension UIViewController {
    
    func showAlert(with title: String, and message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
