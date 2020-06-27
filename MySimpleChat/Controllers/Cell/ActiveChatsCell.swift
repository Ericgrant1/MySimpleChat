//
//  ActiveChatsCell.swift
//  MySimpleChat
//
//  Created by Eric Grant on 27.06.2020.
//  Copyright © 2020 Eric Grant. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

protocol ConfigureCell {
    static var reuseId: String { get }
    func configure(with value: MyChat)
}

class ActiveChatsCell: UICollectionViewCell, ConfigureCell {
    
    // MARK: - Properties
    
    static var reuseId: String = "ActiveCahtsCell"
    
    let friendImageView = UIImageView()
    let friendName = UILabel(text: "User Name", font: .laoSangamMN20(), textColor: .black)
    let lastMessage = UILabel(text: "How are you?", font: .laoSangamMN18(), textColor: .black)
    let gradientView = UIView()
    
    // MARK: - Lifecyrcle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func configure(with value: MyChat) {
        print("123")
    }
}

// MARK: - SwiftUI

struct ActiveChatsProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let tabBarVC = MainTabBarController()
        
        func makeUIViewController(context: Context) -> MainTabBarController {
            return tabBarVC
        }
        
        func updateUIViewController(_ uiViewController: MainTabBarController, context: Context) {
        }
    }
}