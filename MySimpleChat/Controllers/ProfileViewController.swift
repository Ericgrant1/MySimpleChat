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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - SwiftUI

struct ProfileViewControllerProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let ProfileVC = ProfileViewController()
        
        func makeUIViewController(context: Context) -> ProfileViewController {
            return ProfileVC
        }
        
        func updateUIViewController(_ uiViewController: ProfileViewController, context: Context) {
        }
    }
}
