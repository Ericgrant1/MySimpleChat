//
//  ProfileViewController.swift
//  MySimpleChat
//
//  Created by Eric Grant on 05.07.2020.
//  Copyright © 2020 Eric Grant. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class ProfileViewController: UIViewController {
    
    // MARK: - Properties
    
    let containerView = UIView()
    let imageView = UIImageView(image: #imageLiteral(resourceName: "human3"), contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "Aron Freedman", font: .systemFont(ofSize: 21, weight: .light), textColor: .black)
    let aboutMeLabel = UILabel(text: "You have the opportunity to chat with the best man in the World!", font: .systemFont(ofSize: 15, weight: .light), textColor: .black)
    let userTextField = UITextField()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        customizeElements()
        configureUI()
    }
    
    // MARK: - Helpers
    
    private func customizeElements() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.translatesAutoresizingMaskIntoConstraints = false
        userTextField.translatesAutoresizingMaskIntoConstraints = false
        
        aboutMeLabel.numberOfLines = 0
        
        containerView.backgroundColor = .mainWhite()
        containerView.layer.cornerRadius = 28
    }
}

// MARK: - Setup constraints

extension ProfileViewController {
    
    private func configureUI() {
        
    }
}

// MARK: - SwiftUI

struct ProfileViewControllerProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let profileVC = ProfileViewController()
        
        func makeUIViewController(context: Context) -> ProfileViewController {
            return profileVC
        }
        
        func updateUIViewController(_ uiViewController: ProfileViewController, context: Context) {
        }
    }
}
