//
//  GradientView.swift
//  MySimpleChat
//
//  Created by Eric Grant on 28.06.2020.
//  Copyright © 2020 Eric Grant. All rights reserved.
//

import Foundation
import UIKit

enum Point {
    case topLeading
    case leading
    case bottomLeading
    case top
    case center
    case bottom
    case topTrailing
    case trailing
    case bottomTrailing
    
    var point: CGPoint {
        switch self {
        case .topLeading:
            return CGPoint(x: 0, y: 0)
        case .leading:
            return CGPoint(x: 0, y: 0.5)
        case .bottomLeading:
            return CGPoint(x: 0, y: 1.0)
        case .top:
            return CGPoint(x: 0.5, y: 0)
        case .center:
            return CGPoint(x: 0.5, y: 0.5)
        case .bottom:
            return CGPoint(x: 0.5, y: 1.0)
        case .topTrailing:
            return CGPoint(x: 1.0, y: 0.0)
        case .trailing:
            return CGPoint(x: 1.0, y: 0.5)
        case .bottomTrailing:
            return CGPoint(x: 1.0, y: 1.0)
        }
    }
}

class GradientView: UIView {
    
    // MARK: - Properties
    
    private let gradientLayer = CAGradientLayer()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    private func configureGradient(from: Point, to: Point, startColor: UIColor?, endColor: UIColor?) {
        self.layer.addSublayer(gradientLayer)
    }
}
