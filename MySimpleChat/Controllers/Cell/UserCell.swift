//
//  UserCell.swift
//  MySimpleChat
//
//  Created by Eric Grant on 03.07.2020.
//  Copyright © 2020 Eric Grant. All rights reserved.
//

import Foundation
import UIKit

class UserCell: UICollectionViewCell, ConfigureCell {
    
    // MARK: - Properties
    
    static var reuseId: String = "UserCell"
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func configure(with value: MyChat) {
        print("")
    }
}


