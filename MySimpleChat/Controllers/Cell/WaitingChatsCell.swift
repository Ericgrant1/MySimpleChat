//
//  WaitingChatsCell.swift
//  MySimpleChat
//
//  Created by Eric Grant on 29.06.2020.
//  Copyright © 2020 Eric Grant. All rights reserved.
//

import Foundation
import UIKit

class WaitingChatsCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static var reuseId: String = "WaitingChatsCell"
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .yellow
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func configure(with value: MyChat) {
        
    }
}
