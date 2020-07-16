//
//  MainTabBarController.swift
//  MySimpleChat
//
//  Created by Eric Grant on 24.06.2020.
//  Copyright © 2020 Eric Grant. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    // MARK: - Properties
    
    private let currentUser: ModelUser
    
    // MARK: - Lifecycle
    
    init(currentUser: ModelUser) {
        self.currentUser = currentUser
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let contactsViewController = ContactsViewController()
        let listViewController = ListViewController()
        
        tabBar.tintColor = #colorLiteral(red: 0.5568627451, green: 0.3529411765, blue: 0.968627451, alpha: 1)
        let peopleImage = UIImage(systemName: "person.2",
                                   withConfiguration: UIImage.SymbolConfiguration(weight: .medium))!
        let conversationImage = UIImage(systemName: "bubble.left.and.bubble.right",
                                        withConfiguration: UIImage.SymbolConfiguration(weight: .medium))!
        
        viewControllers = [
            createNavigationController(rootViewController: contactsViewController,
                                       title: "Contacts",
                                       image: peopleImage),
            createNavigationController(rootViewController: listViewController,
                                       title: "Conversation",
                                       image: conversationImage)
        ]
    }
    
    // MARK: - Helpers
    
    private func createNavigationController(rootViewController: UIViewController,
                                            title: String,
                                            image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}
