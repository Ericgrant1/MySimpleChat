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
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listViewController = ListViewController()
        let contactsViewController = ContactsViewController()
        
        viewControllers = [
            listViewController,
            contactsViewController
        ]
    }
    
    // MARK: - Helpers
}
