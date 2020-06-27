//
//  ActiveChatsCell.swift
//  MySimpleChat
//
//  Created by Eric Grant on 27.06.2020.
//  Copyright © 2020 Eric Grant. All rights reserved.
//

import Foundation
import UIKit

protocol ConfigureCell {
    static var reuseId: String { get }
    func configure(with value: MyChat)
}

class ActiveChatsCell: UICollectionViewCell, ConfigureCell {
    
    static var reuseId: String = "ActiveCahtsCell"
    
    let friendImageView = UIImageView()
    let friendName = UILabel(text: "User Name", textColor: .black)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with value: MyChat) {
        
    }
}
