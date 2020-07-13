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
}
