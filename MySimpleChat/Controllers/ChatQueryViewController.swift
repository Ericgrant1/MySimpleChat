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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
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
