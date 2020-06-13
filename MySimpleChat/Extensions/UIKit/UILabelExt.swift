//
//  UILabelExt.swift
//  MySimpleChat
//
//  Created by Eric Grant on 12.06.2020.
//  Copyright © 2020 Eric Grant. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    convenience init(text: String, font: UIFont? = .avenir20(), textColor: UIColor) {
        self.init()
        
        self.text = text
        self.font = font
        self.textColor = textColor
    }
}
