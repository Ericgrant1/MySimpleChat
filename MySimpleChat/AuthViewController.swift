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
    
    let googleLabel = UILabel(text: "Get started with")
    let emailLabel = UILabel(text: "Or sign up with")
    let alreadyOnboardLabel = UILabel(text: "Already onboard?")
    
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
        
        view.backgroundColor = .darkGray
        
        setupConstraints()
    }
    
    // MARK: - Hepler functions
    
    private func setupConstraints() {
        
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
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
