//
//  ChatQueryViewController.swift
//  MySimpleChat
//
//  Created by Eric Grant on 06.07.2020.
//  Copyright © 2020 Eric Grant. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class ChatQueryViewController: UIViewController {
    
    // MARK: - Properties
    
    let containerView = UIView()
    let imageView = UIImageView(image: #imageLiteral(resourceName: <#T##String#>), contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "Aron Freedman", font: .systemFont(ofSize: 21, weight: .light), textColor: .black)
    let aboutMeLabel = UILabel(text: "You have the opportunity to start a new chat.", font: .systemFont(ofSize: 15, weight: .light), textColor: .black)
    let acceptButton = UIButton(title: "ACCEPT",
                                titleColor: .white,
                                backgroundColor: .black,
                                font: .laoSangamMN20(),
                                isShadow: false,
                                cornerRadius: 12)
    let denyButton = UIButton(title: "DENY",
                              titleColor: #colorLiteral(red: 0.8352941176, green: 0.2, blue: 0.2, alpha: 1),
                              backgroundColor: .mainWhite(),
                              font: .laoSangamMN20(),
                              isShadow: false,
                              cornerRadius: 12)
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
    }
}

// MARK: - Setup constraints

extension ChatQueryViewController {
    
    private func configureUI() {
        
    }
}

// MARK: - SwiftUI

struct ChatQueryViewControllerProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let ChatQueryVC = ChatQueryViewController()
        
        func makeUIViewController(context: Context) -> ChatQueryViewController {
            return ChatQueryVC
        }
        
        func updateUIViewController(_ uiViewController: ChatQueryViewController, context: Context) {
        }
    }
}
