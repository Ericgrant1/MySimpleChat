//
//  FirestoreService.swift
//  MySimpleChat
//
//  Created by Eric Grant on 13.07.2020.
//  Copyright © 2020 Eric Grant. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

class FirestoreService {
    
    static let shared = FirestoreService()
    
    let db = Firestore.firestore()
    
    private var usersRef: CollectionReference {
        return db.collection("users")
    }
    
    func saveProfile(id: String,
                     email: String,
                     username: String?,
                     avatarImageString: String?,
                     description: String?,
                     sex: String?,
                     completion: @escaping(Result<ModelUser, Error>) -> Void) {
        
        guard Validation.isFieled(username: username, description: description, sex: sex) else {
            completion(.failure(UserError.notPopulated))
            return
        }
        
        let modelUser = ModelUser(username: username!,
                                  email: email,
                                  avatarImageString: "not exist",
                                  description: description!,
                                  sex: sex!,
                                  id: id)
        self.usersRef.document(modelUser.id).setData(modelUser.representation) { (error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(modelUser))
            }
        }
    }
}
