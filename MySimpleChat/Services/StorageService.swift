//
//  StorageService.swift
//  MySimpleChat
//
//  Created by Eric Grant on 20.07.2020.
//  Copyright © 2020 Eric Grant. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseStorage

class StorageService {
    
    static let shared = StorageService()
    
    let storageRef = Storage.storage().reference()
    
    private var avatarReferance: StorageReference {
        return storageRef.child("avatars")
    }
    
    func upload(image: UIImage, completion: @escaping(Result<URL, Error>) -> Void) {
        
        
    }
}
