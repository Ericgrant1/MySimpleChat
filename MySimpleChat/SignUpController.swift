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
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
