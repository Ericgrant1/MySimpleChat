//
//  ButtonFormView.swift
//  MySimpleChat
//
//  Created by Eric Grant on 13.06.2020.
//  Copyright © 2020 Eric Grant. All rights reserved.
//

import Foundation
import UIKit

class ButtonFormView: UIView {
    
    init(label: UILabel, button: UIButton) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
        
        self.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            button.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        bottomAnchor.constraint(equalTo: button.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
