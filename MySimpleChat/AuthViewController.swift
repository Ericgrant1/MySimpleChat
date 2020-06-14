//
//  ViewController.swift
//  MySimpleChat
//
//  Created by Eric Grant on 12.06.2020.
//  Copyright © 2020 Eric Grant. All rights reserved.
//

import UIKit
import SwiftUI

class AuthViewController: UIViewController {

    // MARK: - Properties
    
    let logoImageView = UIImageView(image: #imageLiteral(resourceName: "mychatLogo"), contentMode: .scaleAspectFit)
    
    let googleLabel = UILabel(text: "Get started with", textColor: .white)
    let emailLabel = UILabel(text: "Or Sign up with", textColor: .white)
    let alreadyHaveAccountLabel = UILabel(text: "Already have an account?", textColor: .white)
    
    let googleButton = UIButton(title: "Google",
                                titleColor: .black,
                                backgroundColor: .white,
                                isShadow: true)

    let emailButton = UIButton(title: "Email",
                               titleColor: .white,
                               backgroundColor: .buttonDark())
    
    let loginButton = UIButton(title: "Login",
                               titleColor: .buttonRed(),
                               backgroundColor: .white,
                               isShadow: true)
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        googleButton.customizedGoogleButton()
        configureUI()
    }
    
    // MARK: - Hepler functions
    
}

// MARK: - Setup constraints

extension AuthViewController {
    
    private func configureUI() {
        
        let googleView = ButtonFormView(label: googleLabel, button: googleButton)
        let emailView = ButtonFormView(label: emailLabel, button: emailButton)
        let loginView = ButtonFormView(label: alreadyHaveAccountLabel, button: loginButton)
        let stackView = UIStackView(arrangedSubviews: [googleView, emailView, loginView], axis: .vertical, spacing: 40)
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 160),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
}

// MARK: - SwiftUI

struct AuthViewControllerProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = AuthViewController()
        
        func makeUIViewController(context: Context) -> AuthViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: AuthViewController, context: Context) {
            
        }
    }
}
