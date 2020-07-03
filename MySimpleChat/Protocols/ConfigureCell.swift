//
//  ConfigureCell.swift
//  MySimpleChat
//
//  Created by Eric Grant on 29.06.2020.
//  Copyright © 2020 Eric Grant. All rights reserved.
//

import Foundation

protocol ConfigureCell {
    static var reuseId: String { get }
    func configure<U: Hashable>(with value: U)
}
