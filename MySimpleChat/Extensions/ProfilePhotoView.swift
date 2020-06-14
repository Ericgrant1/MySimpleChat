//
//  ProfilePhotoView.swift
//  MySimpleChat
//
//  Created by Eric Grant on 14.06.2020.
//  Copyright © 2020 Eric Grant. All rights reserved.
//

import Foundation
import UIKit

class ProfilePhotoView: UIView {
    
    // MARK: - Properties
    
    var profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = #imageLiteral(resourceName: "avatar")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.borderColor = UIColor.white.cgColor
        iv.layer.borderWidth = 2
        return iv
    }()
    
    let plusPhotoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let plusImage = #imageLiteral(resourceName: "plus")
        button.setImage(plusImage, for: .normal)
        button.tintColor = .buttonWhite()
        return button
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(profileImageView)
        addSubview(plusPhotoButton)
        configureUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper functions
    
    private func configureUI() {
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            profileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            plusPhotoButton.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            plusPhotoButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            plusPhotoButton.widthAnchor.constraint(equalToConstant: 30),
            plusPhotoButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        self.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: plusPhotoButton.trailingAnchor).isActive = true
    }
}
