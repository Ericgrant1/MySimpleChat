//
//  ProfileController.swift
//  MySimpleChat
//
//  Created by Eric Grant on 14.06.2020.
//  Copyright © 2020 Eric Grant. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class ProfileController: UIViewController {
    
    // MARK: - Properties
    
    let populateImageView = ProfilePhotoView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        configureUI()
    }
}

extension ProfileController {
    
    private func configureUI() {
        
        populateImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(populateImageView)
        
        NSLayoutConstraint.activate([
            populateImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            populateImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

// MARK: - SwiftUI

struct ProfileControllerProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let profileUpVC = ProfileController()
        
        func makeUIViewController(context: Context) -> ProfileController {
            return profileUpVC
        }
        
        func updateUIViewController(_ uiViewController: ProfileController, context: Context) {
            
        }
    }
}
