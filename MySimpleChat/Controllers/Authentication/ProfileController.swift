//
//  ProfileController.swift
//  MySimpleChat
//
//  Created by Eric Grant on 14.06.2020.
//  Copyright © 2020 Eric Grant. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import FirebaseAuth
import SDWebImage

class ProfileController: UIViewController {
    
    // MARK: - Properties
    
    let greetingLabel = UILabel(text: "Set up profile!", font: .avenir26(), textColor: .white)
    
    let populateImageView = ProfilePhotoView()
    
    let fullnameLabel = UILabel(text: "Fullname", textColor: .white)
    let aboutMeLabel = UILabel(text: "About me", textColor: .white)
    let sexLabel = UILabel(text: "Sex", textColor: .white)
    
    let fullnameTextField = TextFieldFormView(font: .avenir20())
    let aboutMeTextField = TextFieldFormView(font: .avenir20())
    
    let sexSegmentedControl = UISegmentedControl(first: "Male", second: "Female")
    
    let goToChatsButton = UIButton(title: "Go to chats!",
                                   titleColor: .white,
                                   backgroundColor: .buttonDark(),
                                   cornerRadius: 4)
    
    private let currentUser: User
    
    init(currentUser: User) {
        self.currentUser = currentUser
        super.init(nibName: nil, bundle: nil)
        
        if let username = currentUser.displayName {
            fullnameTextField.text = username
        }
        // TODO set google image
        if let imageURL = currentUser.photoURL {
            populateImageView.profileImageView.sd_setImage(with: imageURL, completed: nil)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        configureUI()
        
        goToChatsButton.addTarget(self, action: #selector(handleChatsButtonTapped), for: .touchUpInside)
        
        populateImageView.plusPhotoButton.addTarget(self, action: #selector(handlePlusButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Selectors
    
    @objc private func handlePlusButtonTapped() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @objc private func handleChatsButtonTapped() {
        
        FirestoreService.shared.saveProfile(
            id: currentUser.uid,
            email: currentUser.email!,
            username: fullnameTextField.text,
            avatarImage: populateImageView.profileImageView.image,
            description: aboutMeTextField.text,
            sex: sexSegmentedControl.titleForSegment(
                at: sexSegmentedControl.selectedSegmentIndex)) { (result) in
                    switch result {
                    case .success(let modelUser):
                        self.showAlert(with: "Successfully!", and: "Have a nice chat!", completion: {
                            let mainTabBar = MainTabBarController(currentUser: modelUser)
                            mainTabBar.modalPresentationStyle = .fullScreen
                            self.present(mainTabBar, animated: true, completion: nil)
                        })
                        print(modelUser)
                    case .failure(let error):
                        self.showAlert(with: "Error!", and: error.localizedDescription)
                    }
        }
    }
}

// MARK: - Setup constraints

extension ProfileController {
    
    private func configureUI() {
        
        let fullNameStackView = UIStackView(arrangedSubviews: [fullnameLabel, fullnameTextField],
                                                axis: .vertical,
                                                spacing: 0)
        let aboutMeStackView = UIStackView(arrangedSubviews: [aboutMeLabel, aboutMeTextField],
                                           axis: .vertical,
                                           spacing: 0)
        let sexTextView = UIStackView(arrangedSubviews: [sexLabel, sexSegmentedControl],
                                      axis: .vertical,
                                      spacing: 10)
        
        goToChatsButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        let stackView = UIStackView(arrangedSubviews: [fullNameStackView, aboutMeStackView, sexTextView, goToChatsButton],
                                    axis: .vertical,
                                    spacing: 40)
        
        greetingLabel.translatesAutoresizingMaskIntoConstraints = false
        populateImageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(greetingLabel)
        view.addSubview(populateImageView)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            greetingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            greetingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            populateImageView.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 40),
            populateImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
             stackView.topAnchor.constraint(equalTo: populateImageView.bottomAnchor, constant: 40),
             stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
             stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
         ])
    }
}

// MARK: - UIImagePickerControllerDelegate

extension ProfileController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        populateImageView.profileImageView.image = image
    }
}

// MARK: - SwiftUI

struct ProfileControllerProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let profileUpVC = ProfileController(currentUser: Auth.auth().currentUser!)
        
        func makeUIViewController(context: Context) -> ProfileController {
            return profileUpVC
        }
        
        func updateUIViewController(_ uiViewController: ProfileController, context: Context) {
            
        }
    }
}
