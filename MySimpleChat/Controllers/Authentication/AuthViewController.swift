//
//  AuthViewController.swift
//  MySimpleChat
//
//  Created by Eric Grant on 12.06.2020.
//  Copyright © 2020 Eric Grant. All rights reserved.
//

import UIKit
import SwiftUI
import GoogleSignIn

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
    
    let signUpVC = SignUpController()
    let loginVC = LoginController()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        googleButton.customizedGoogleButton()
        configureUI()
        
        emailButton.addTarget(self, action: #selector(handleEmailTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(handleAuthLoginTapped), for: .touchUpInside)
        googleButton.addTarget(self, action: #selector(handleGoogleButtonTapped), for: .touchUpInside)
        
        signUpVC.delegate = self
        loginVC.delegate = self
        
        GIDSignIn.sharedInstance()?.delegate = self
    }
    
    // MARK: - Selectors
    
    @objc private func handleEmailTapped() {
        print(#function)
        present(signUpVC, animated: true, completion: nil)
    }
    
    @objc private func handleAuthLoginTapped() {
        print(#function)
        present(loginVC, animated: true, completion: nil)
    }
    
    @objc private func handleGoogleButtonTapped() {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
    }
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

// MARK: - AuthNavigationDelegate

extension AuthViewController: AuthNavigationDelegate {
    
    func handleToLoginVC() {
        present(loginVC, animated: true, completion: nil)
    }
    
    func handleToSignUpVC() {
        present(signUpVC, animated: true, completion: nil)
    }
}

// MARK: - GIDSignInDelegate

extension AuthViewController: GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        AuthService.shared.googleLogin(user: user, error: error) { (result) in
            switch result {
            case .success(let user):
                FirestoreService.shared.getUserData(user: user) { (result) in
                    switch result {
                    case .success(let modelUser):
                        UIApplication.getTopViewController()?.showAlert(with: "Successfully!", and: "You're logged in!") {
                            let mainTabBar = MainTabBarController(currentUser: modelUser)
                            mainTabBar.modalPresentationStyle = .fullScreen
                            UIApplication.getTopViewController()?.present(mainTabBar, animated: true, completion: nil)
                        }
                    case .failure(_):
                        UIApplication.getTopViewController()?.showAlert(with: "Successfully!", and: "You're registered!") {
                            UIApplication.getTopViewController()?.present(ProfileController(currentUser: user), animated: true, completion: nil)
                        }
                    }
                }
            case .failure(let error):
                self.showAlert(with: "Error!", and: error.localizedDescription)
            }
        }
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
