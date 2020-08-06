//
//  ModelUser.swift
//  MySimpleChat
//
//  Created by Eric Grant on 02.07.2020.
//  Copyright © 2020 Eric Grant. All rights reserved.
//

import Foundation
import UIKit
import FirebaseFirestore

struct ModelUser: Hashable, Decodable {
    var username: String
    var email: String
    var avatarImageString: String
    var description: String
    var sex: String
    var id: String
    
    init(username: String, email: String, avatarImageString: String, description: String, sex: String, id: String) {
        self.username = username
        self.email = email
        self.avatarImageString = avatarImageString
        self.description = description
        self.sex = sex
        self.id = id
    }
    
    init?(document: DocumentSnapshot) {
        guard let data = document.data() else { return nil }
        guard let username = data["username"] as? String,
        let email = data["email"] as? String,
        let avatarImageString = data["avatarImageString"] as? String,
        let description = data["description"] as? String,
        let sex = data["sex"] as? String,
        let id = data["uid"] as? String else { return nil }
        
        self.username = username
        self.email = email
        self.avatarImageString = avatarImageString
        self.description = description
        self.sex = sex
        self.id = id
    }
    
    init?(document: QueryDocumentSnapshot) {
        let data = document.data()
        guard let username = data["username"] as? String,
        let email = data["email"] as? String,
        let avatarImageString = data["avatarImageString"] as? String,
        let description = data["description"] as? String,
        let sex = data["sex"] as? String,
        let id = data["uid"] as? String else { return nil }
        
        self.username = username
        self.email = email
        self.avatarImageString = avatarImageString
        self.description = description
        self.sex = sex
        self.id = id
    }
    
    var representation: [String: Any] {
        var rep = ["username": username]
        rep["email"] = email
        rep["avatarImageString"] = avatarImageString
        rep["description"] = description
        rep["sex"] = sex
        rep["uid"] = id
        
        return rep
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: ModelUser, rhs: ModelUser) -> Bool {
        return lhs.id == rhs.id
    }
    
    func contains(filter: String?) -> Bool {
        guard let filter = filter else { return true }
        if filter.isEmpty { return true }
        let lowercasedFilter = filter.lowercased()
        return username.lowercased().contains(lowercasedFilter)
    }
}
